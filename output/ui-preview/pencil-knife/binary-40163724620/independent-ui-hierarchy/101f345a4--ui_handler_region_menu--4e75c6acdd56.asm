
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f345a4 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv>:
101f345a4:     	stp	x26, x25, [sp, #-0x50]!
101f345a8:     	stp	x24, x23, [sp, #0x10]
101f345ac:     	stp	x22, x21, [sp, #0x20]
101f345b0:     	stp	x20, x19, [sp, #0x30]
101f345b4:     	stp	x29, x30, [sp, #0x40]
101f345b8:     	add	x29, sp, #0x40
101f345bc:     	mov	x20, x1
101f345c0:     	mov	x19, x0
101f345c4:     	bl	0x1000b4458 <__Z19CTX_wm_region_popupPK8bContext>
101f345c8:     	mov	x21, x0
101f345cc:     	cbz	x0, 0x101f3465c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0xb8>
101f345d0:     	ldr	x8, [x21, #0x128]
101f345d4:     	ldr	x24, [x8, #0x260]
101f345d8:     	mov	x22, x21
101f345dc:     	cbz	x24, 0x101f3469c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0xf8>
101f345e0:     	mov	x0, x24
101f345e4:     	mov	x1, x20
101f345e8:     	bl	0x101f93d4c <__Z26ui_ipad_ring_dismiss_inputP7uiBlockPK7wmEvent>
101f345ec:     	tbnz	w0, #0x0, 0x101f34930 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x38c>
101f345f0:     	mov	x0, x19
101f345f4:     	mov	x1, x24
101f345f8:     	mov	x2, x20
101f345fc:     	bl	0x101f93db0 <__Z23ui_ipad_ring_home_inputP8bContextP7uiBlockPK7wmEvent>
101f34600:     	tbnz	w0, #0x0, 0x101f34938 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x394>
101f34604:     	mov	x0, x24
101f34608:     	bl	0x101f8fd04 <__Z27ui_ipad_ring_waits_for_drawPK7uiBlock>
101f3460c:     	tbnz	w0, #0x0, 0x101f34938 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x394>
101f34610:     	add	x1, x24, #0x3b0
101f34614:     	mov	x0, x19
101f34618:     	bl	0x101f8f1cc <__Z27ui_ipad_action_origin_validP8bContextRKN7blender2ui4ipad12ActionOriginE>
101f3461c:     	ldr	x1, [x24, #0x3a8]
101f34620:     	tbz	w0, #0x0, 0x101f347a8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x204>
101f34624:     	cbz	x1, 0x101f34634 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x90>
101f34628:     	mov	x0, x19
101f3462c:     	bl	0x101f05db0 <__Z27ui_ipad_numbers_popup_validP8bContextP18uiPopupBlockHandle>
101f34630:     	tbz	w0, #0x0, 0x101f34860 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x2bc>
101f34634:     	mov	x0, x21
101f34638:     	bl	0x101f73934 <__Z25ui_region_find_active_butP7ARegion>
101f3463c:     	mov	x23, x0
101f34640:     	ldr	x8, [x24, #0x418]
101f34644:     	cbz	x8, 0x101f34874 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x2d0>
101f34648:     	mov	w8, #0x1                ; =1
101f3464c:     	mov	w25, #0x1               ; =1
101f34650:     	mov	x22, x21
101f34654:     	cbnz	x23, 0x101f346bc <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x118>
101f34658:     	b	0x101f34884 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x2e0>
101f3465c:     	mov	x0, x19
101f34660:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f34664:     	mov	x22, x0
101f34668:     	mov	x0, x19
101f3466c:     	mov	x1, x22
101f34670:     	bl	0x10163a2bc <__Z27ED_ipad_editing_shelf_staleP8bContextP7ARegion>
101f34674:     	cbz	w0, 0x101f3469c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0xf8>
101f34678:     	ldrh	w8, [x20, #0x10]
101f3467c:     	sub	w8, w8, #0x1
101f34680:     	cmp	w8, #0x16
101f34684:     	b.hi	0x101f34764 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1c0>
101f34688:     	add	x1, x20, #0x14
101f3468c:     	mov	x0, x19
101f34690:     	bl	0x10163a270 <__Z25ED_ipad_editing_shelf_hitP8bContextPKi>
101f34694:     	mov	x20, x0
101f34698:     	b	0x101f34768 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1c4>
101f3469c:     	mov	x0, x22
101f346a0:     	bl	0x101f73934 <__Z25ui_region_find_active_butP7ARegion>
101f346a4:     	mov	x23, x0
101f346a8:     	cbz	x23, 0x101f3487c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x2d8>
101f346ac:     	ldr	x8, [x23, #0x420]
101f346b0:     	ldr	x8, [x8, #0x418]
101f346b4:     	cmp	x8, #0x0
101f346b8:     	cset	w25, ne
101f346bc:     	mov	x0, x19
101f346c0:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
101f346c4:     	ldr	x26, [x23, #0x3d0]
101f346c8:     	ldr	w8, [x26, #0x24]
101f346cc:     	cmp	w8, #0x8
101f346d0:     	b.ne	0x101f34788 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1e4>
101f346d4:     	mov	x24, x0
101f346d8:     	ldr	x8, [x26, #0xf0]
101f346dc:     	ldr	x0, [x8, #0x1e0]
101f346e0:     	bl	0x101f73934 <__Z25ui_region_find_active_butP7ARegion>
101f346e4:     	cbnz	x0, 0x101f346f8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x154>
101f346e8:     	mov	x0, x24
101f346ec:     	mov	x1, x20
101f346f0:     	bl	0x101f739cc <__Z32ui_screen_region_find_mouse_overP7bScreenPK7wmEvent>
101f346f4:     	cbz	x0, 0x101f347bc <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x218>
101f346f8:     	ldr	w8, [x26, #0x24]
101f346fc:     	cmp	w8, #0x8
101f34700:     	b.ne	0x101f34788 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1e4>
101f34704:     	ldr	x2, [x26, #0xf0]
101f34708:     	cbz	x2, 0x101f3477c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1d8>
101f3470c:     	mov	x0, x19
101f34710:     	mov	x1, x20
101f34714:     	mov	w3, #0x0                ; =0
101f34718:     	mov	w4, #0x0                ; =0
101f3471c:     	mov	w5, #0x0                ; =0
101f34720:     	mov	w6, #0x0                ; =0
101f34724:     	bl	0x101f478f4 <__ZL25ui_handle_menus_recursiveP8bContextPK7wmEventP18uiPopupBlockHandleibbb>
101f34728:     	ldr	x8, [x26, #0xf0]
101f3472c:     	cbz	x8, 0x101f34734 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x190>
101f34730:     	cbz	w0, 0x101f34744 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1a0>
101f34734:     	ldrh	w9, [x20, #0x10]
101f34738:     	cmp	w9, #0x110
101f3473c:     	b.ne	0x101f34798 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1f4>
101f34740:     	cbz	x8, 0x101f34788 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1e4>
101f34744:     	ldr	w8, [x8, #0x28c]
101f34748:     	cbz	w8, 0x101f34788 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1e4>
101f3474c:     	mov	x0, x19
101f34750:     	mov	x1, x20
101f34754:     	mov	x2, x23
101f34758:     	bl	0x101f4932c <__ZL31ui_handle_button_return_submenuP8bContextPK7wmEventP5uiBut>
101f3475c:     	mov	w0, #0x1                ; =1
101f34760:     	b	0x101f34798 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1f4>
101f34764:     	mov	w20, #0x0               ; =0
101f34768:     	mov	x0, x19
101f3476c:     	mov	x1, x22
101f34770:     	bl	0x10163f63c <__Z32ED_ipad_editing_shelf_invalidateP8bContextP7ARegion>
101f34774:     	mov	x0, x20
101f34778:     	b	0x101f3493c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x398>
101f3477c:     	ldrh	w8, [x20, #0x10]
101f34780:     	cmp	w8, #0x110
101f34784:     	b.ne	0x101f34858 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x2b4>
101f34788:     	mov	x0, x19
101f3478c:     	mov	x1, x20
101f34790:     	mov	x2, x23
101f34794:     	bl	0x101f4630c <__ZL22ui_handle_button_eventP8bContextPK7wmEventP5uiBut>
101f34798:     	mov	w8, #0x0                ; =0
101f3479c:     	cmp	w0, #0x0
101f347a0:     	cset	w24, eq
101f347a4:     	b	0x101f34888 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x2e4>
101f347a8:     	mov	w0, #0x0                ; =0
101f347ac:     	cbz	x1, 0x101f3493c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x398>
101f347b0:     	mov	w8, #0x1                ; =1
101f347b4:     	str	w8, [x1, #0x28c]
101f347b8:     	b	0x101f3493c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x398>
101f347bc:     	mov	x0, x22
101f347c0:     	mov	x1, x20
101f347c4:     	bl	0x101f72eb8 <__Z22ui_but_find_mouse_overPK7ARegionPK7wmEvent>
101f347c8:     	cbz	x0, 0x101f346f8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x154>
101f347cc:     	mov	x24, x0
101f347d0:     	mov	x0, x23
101f347d4:     	mov	x1, x24
101f347d8:     	mov	x2, x20
101f347dc:     	bl	0x101f47768 <__ZL26ui_can_activate_other_menuP5uiButS0_PK7wmEvent>
101f347e0:     	cbz	w0, 0x101f346f8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x154>
101f347e4:     	ldr	x8, [x26, #0xf0]
101f347e8:     	ldr	w8, [x8, #0x2a4]
101f347ec:     	tst	w8, #0xc
101f347f0:     	b.eq	0x101f34810 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x26c>
101f347f4:     	add	x0, x23, #0x70
101f347f8:     	add	x1, x24, #0x70
101f347fc:     	mov	x2, #0x0                ; =0
101f34800:     	bl	0x1007fd8ac <__Z21BLI_rctf_isect_rect_xPK4rctfS1_Pf>
101f34804:     	tbnz	w0, #0x0, 0x101f3482c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x288>
101f34808:     	ldr	x8, [x26, #0xf0]
101f3480c:     	ldr	w8, [x8, #0x2a4]
101f34810:     	tst	w8, #0x3
101f34814:     	b.eq	0x101f346f8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x154>
101f34818:     	add	x0, x23, #0x70
101f3481c:     	add	x1, x24, #0x70
101f34820:     	mov	x2, #0x0                ; =0
101f34824:     	bl	0x1007fd8f4 <__Z21BLI_rctf_isect_rect_yPK4rctfS1_Pf>
101f34828:     	cbz	w0, 0x101f346f8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x154>
101f3482c:     	mov	x0, x19
101f34830:     	mov	x1, x22
101f34834:     	mov	x2, x24
101f34838:     	mov	w3, #0x0                ; =0
101f3483c:     	bl	0x101f39638 <__ZL25ui_handle_button_activateP8bContextP7ARegionP5uiBut20uiButtonActivateType>
101f34840:     	mov	x0, x19
101f34844:     	mov	x1, x24
101f34848:     	mov	w2, #0x8                ; =8
101f3484c:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f34850:     	mov	w0, #0x1                ; =1
101f34854:     	b	0x101f34798 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1f4>
101f34858:     	mov	w0, #0x0                ; =0
101f3485c:     	b	0x101f34798 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x1f4>
101f34860:     	mov	w0, #0x0                ; =0
101f34864:     	ldr	x8, [x24, #0x3a8]
101f34868:     	mov	w9, #0x1                ; =1
101f3486c:     	str	w9, [x8, #0x28c]
101f34870:     	b	0x101f3493c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x398>
101f34874:     	mov	x22, x21
101f34878:     	cbnz	x23, 0x101f346ac <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x108>
101f3487c:     	mov	w25, #0x0               ; =0
101f34880:     	mov	w8, #0x1                ; =1
101f34884:     	mov	w24, #0x1               ; =1
101f34888:     	ldrh	w9, [x20, #0x10]
101f3488c:     	cmp	w9, #0x4
101f34890:     	b.ne	0x101f348d8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x334>
101f34894:     	ldr	w9, [x20, #0x14]
101f34898:     	ldr	w10, [x20, #0x94]
101f3489c:     	cmp	w9, w10
101f348a0:     	b.ne	0x101f348bc <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x318>
101f348a4:     	cbz	x22, 0x101f348d8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x334>
101f348a8:     	ldr	w9, [x20, #0x18]
101f348ac:     	ldr	w10, [x20, #0x98]
101f348b0:     	cmp	w9, w10
101f348b4:     	b.ne	0x101f348c0 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x31c>
101f348b8:     	b	0x101f348d8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x334>
101f348bc:     	cbz	x22, 0x101f348d8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x334>
101f348c0:     	ldr	x9, [x22, #0x128]
101f348c4:     	ldr	x9, [x9, #0x260]
101f348c8:     	cbz	x9, 0x101f348d8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x334>
101f348cc:     	strb	wzr, [x9, #0x372]
101f348d0:     	ldr	x9, [x9]
101f348d4:     	cbnz	x9, 0x101f348cc <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x328>
101f348d8:     	tbnz	w8, #0x0, 0x101f348f8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x354>
101f348dc:     	ldr	x8, [x23, #0x3d0]
101f348e0:     	cbz	x8, 0x101f348f8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x354>
101f348e4:     	ldr	x8, [x8, #0xf0]
101f348e8:     	cbz	x8, 0x101f348f8 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x354>
101f348ec:     	ldr	x1, [x8, #0x1e0]
101f348f0:     	mov	x0, x19
101f348f4:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
101f348f8:     	mov	x0, x19
101f348fc:     	bl	0x101f42598 <__ZL24ui_apply_but_funcs_afterP8bContext>
101f34900:     	cbz	w25, 0x101f34914 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x370>
101f34904:     	mov	x0, x19
101f34908:     	mov	x1, x21
101f3490c:     	bl	0x101f05ad8 <__Z28ui_ipad_popup_region_resolveP8bContextm>
101f34910:     	mov	x21, x0
101f34914:     	mov	x0, x19
101f34918:     	mov	x1, x21
101f3491c:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
101f34920:     	cbz	w24, 0x101f34938 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x394>
101f34924:     	ldrh	w8, [x20, #0x12]
101f34928:     	cmp	w8, #0x4
101f3492c:     	b.ne	0x101f34938 <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x394>
101f34930:     	mov	w0, #0x0                ; =0
101f34934:     	b	0x101f3493c <__ZL22ui_handler_region_menuP8bContextPK7wmEventPv+0x398>
101f34938:     	mov	w0, #0x1                ; =1
101f3493c:     	ldp	x29, x30, [sp, #0x40]
101f34940:     	ldp	x20, x19, [sp, #0x30]
101f34944:     	ldp	x22, x21, [sp, #0x20]
101f34948:     	ldp	x24, x23, [sp, #0x10]
101f3494c:     	ldp	x26, x25, [sp], #0x50
101f34950:     	ret
