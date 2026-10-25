
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f32854 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType>:
101f32854:     	ldr	x8, [x2, #0x3d8]
101f32858:     	cbz	x8, 0x101f32860 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0xc>
101f3285c:     	ret
101f32860:     	stp	d9, d8, [sp, #-0x50]!
101f32864:     	stp	x24, x23, [sp, #0x10]
101f32868:     	stp	x22, x21, [sp, #0x20]
101f3286c:     	stp	x20, x19, [sp, #0x30]
101f32870:     	stp	x29, x30, [sp, #0x40]
101f32874:     	add	x29, sp, #0x40
101f32878:     	mov	x23, x3
101f3287c:     	mov	x22, x2
101f32880:     	mov	x19, x1
101f32884:     	mov	x20, x0
101f32888:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101f3288c:     	add	x8, x8, #0x6d0
101f32890:     	ldr	x8, [x8]
101f32894:     	adrp	x2, 0x104d51000 <__ZL3hex+0x18534d>
101f32898:     	add	x2, x2, #0xae9
101f3289c:     	mov	w0, #0x300              ; =768
101f328a0:     	mov	w1, #0x8                ; =8
101f328a4:     	mov	w3, #0x1                ; =1
101f328a8:     	blr	x8
101f328ac:     	mov	x21, x0
101f328b0:     	add	x24, x0, #0x158
101f328b4:     	mov	w1, #0x2f8              ; =760
101f328b8:     	bl	0x104b71840 <_zlibVersion+0x104b71840>
101f328bc:     	stp	x24, x24, [x21, #0x140]
101f328c0:     	add	x8, x21, #0x2d8
101f328c4:     	str	x8, [x21, #0x150]
101f328c8:     	str	xzr, [x21, #0x2e8]
101f328cc:     	str	xzr, [x21, #0x2f8]
101f328d0:     	mov	x0, x20
101f328d4:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f328d8:     	str	x0, [x21]
101f328dc:     	mov	x0, x20
101f328e0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f328e4:     	str	x0, [x21, #0x8]
101f328e8:     	mov	x0, x20
101f328ec:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f328f0:     	stp	x0, x19, [x21, #0x10]
101f328f4:     	mvni.2s	v0, #0x80, lsl #16
101f328f8:     	fneg.2s	v0, v0
101f328fc:     	str	d0, [x21, #0xe8]
101f32900:     	ldrb	w8, [x22, #0x21]
101f32904:     	cmp	w8, #0x21
101f32908:     	b.hi	0x101f329fc <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1a8>
101f3290c:     	mov	w9, #0x1                ; =1
101f32910:     	lsl	x8, x9, x8
101f32914:     	mov	x9, #0x18000000         ; =402653184
101f32918:     	movk	x9, #0x2, lsl #32
101f3291c:     	tst	x8, x9
101f32920:     	b.eq	0x101f329fc <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1a8>
101f32924:     	str	wzr, [x21, #0x24]
101f32928:     	ldr	w8, [x22, #0x18]
101f3292c:     	orr	w8, w8, #0x4
101f32930:     	str	w8, [x22, #0x18]
101f32934:     	str	x21, [x22, #0x3d0]
101f32938:     	cbz	w23, 0x101f329b0 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x15c>
101f3293c:     	mov	x0, x20
101f32940:     	mov	x1, x22
101f32944:     	mov	w2, #0x1                ; =1
101f32948:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f3294c:     	cmp	w23, #0x2
101f32950:     	b.eq	0x101f32a20 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1cc>
101f32954:     	cmp	w23, #0x3
101f32958:     	b.eq	0x101f32a10 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1bc>
101f3295c:     	cmp	w23, #0x4
101f32960:     	b.ne	0x101f32a30 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1dc>
101f32964:     	mov	x0, x20
101f32968:     	mov	x1, x22
101f3296c:     	mov	w2, #0x8                ; =8
101f32970:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f32974:     	ldr	x8, [x21, #0xf0]
101f32978:     	cbz	x8, 0x101f32a30 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1dc>
101f3297c:     	ldr	x23, [x8, #0x1e0]
101f32980:     	cbz	x23, 0x101f32a30 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1dc>
101f32984:     	ldr	x8, [x23, #0x128]
101f32988:     	ldr	x0, [x8, #0x260]
101f3298c:     	cbz	x0, 0x101f32a30 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1dc>
101f32990:     	bl	0x101f73464 <__Z12ui_but_firstP7uiBlock>
101f32994:     	cbz	x0, 0x101f32a30 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1dc>
101f32998:     	mov	x2, x0
101f3299c:     	mov	x0, x20
101f329a0:     	mov	x1, x23
101f329a4:     	mov	w3, #0x1                ; =1
101f329a8:     	bl	0x101f39638 <__ZL25ui_handle_button_activateP8bContextP7ARegionP5uiBut20uiButtonActivateType>
101f329ac:     	b	0x101f32a30 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1dc>
101f329b0:     	ldr	x8, [x22, #0x420]
101f329b4:     	ldrb	w9, [x8, #0x353]
101f329b8:     	cmp	w9, #0x1
101f329bc:     	b.ne	0x101f329e4 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x190>
101f329c0:     	ldr	d0, [x8, #0x360]
101f329c4:     	adrp	x8, 0x104f7f000 <__ZL9monkeyuvs+0x3730>
101f329c8:     	ldr	d1, [x8, #0x678]
101f329cc:     	fadd	d8, d0, d1
101f329d0:     	bl	0x10082df80 <__Z20BLI_time_now_secondsv>
101f329d4:     	fcmp	d8, d0
101f329d8:     	b.pl	0x101f329e4 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x190>
101f329dc:     	ldr	x8, [x22, #0x420]
101f329e0:     	strb	wzr, [x8, #0x353]
101f329e4:     	mov	w8, #0x1                ; =1
101f329e8:     	strb	w8, [x21, #0xa3]
101f329ec:     	mov	x0, x20
101f329f0:     	mov	x1, x22
101f329f4:     	mov	w2, #0x1                ; =1
101f329f8:     	b	0x101f32a2c <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1d8>
101f329fc:     	ldrb	w8, [x22, #0x1b]
101f32a00:     	tbnz	w8, #0x4, 0x101f32924 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0xd0>
101f32a04:     	mov	w8, #0x1                ; =1
101f32a08:     	strb	w8, [x21, #0x20]
101f32a0c:     	b	0x101f32924 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0xd0>
101f32a10:     	mov	x0, x20
101f32a14:     	mov	x1, x22
101f32a18:     	mov	w2, #0x6                ; =6
101f32a1c:     	b	0x101f32a2c <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x1d8>
101f32a20:     	mov	x0, x20
101f32a24:     	mov	x1, x22
101f32a28:     	mov	w2, #0x2                ; =2
101f32a2c:     	bl	0x101f2f9c8 <__ZL21button_activate_stateP8bContextP5uiBut19uiHandleButtonState>
101f32a30:     	ldrb	w8, [x22, #0x21]
101f32a34:     	cmp	w8, #0x6
101f32a38:     	b.eq	0x101f32a70 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x21c>
101f32a3c:     	cmp	w8, #0x2e
101f32a40:     	b.ne	0x101f32a78 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x224>
101f32a44:     	ldp	s1, s0, [x22, #0x70]
101f32a48:     	fsub	s0, s0, s1
101f32a4c:     	ldp	s2, s1, [x22, #0x78]
101f32a50:     	fsub	s1, s1, s2
101f32a54:     	ldr	x0, [x21, #0x8]
101f32a58:     	fcmp	s0, s1
101f32a5c:     	mov	w8, #0x17               ; =23
101f32a60:     	mov	w9, #0x16               ; =22
101f32a64:     	csel	w1, w9, w8, mi
101f32a68:     	bl	0x100b44568 <__Z19WM_cursor_modal_setP8wmWindowi>
101f32a6c:     	b	0x101f32a78 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x224>
101f32a70:     	mov	x0, x22
101f32a74:     	bl	0x101f396a4 <__ZL21ui_numedit_set_activeP5uiBut>
101f32a78:     	mov	x0, x22
101f32a7c:     	bl	0x101f72910 <__Z24UI_but_has_quick_tooltipPK5uiBut>
101f32a80:     	cbz	w0, 0x101f32ae4 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x290>
101f32a84:     	ldr	x0, [x21, #0x8]
101f32a88:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
101f32a8c:     	mov	x22, x0
101f32a90:     	bl	0x10082df80 <__Z20BLI_time_now_secondsv>
101f32a94:     	fmov	d8, d0
101f32a98:     	bl	0x100b927e8 <__Z22WM_tooltip_time_closedv>
101f32a9c:     	fsub	d0, d8, d0
101f32aa0:     	adrp	x8, 0x104efc000 <__ZTSN3tbb6detail2d223for_each_root_task_baseIPZL34grease_pencil_do_layer_adjustmentsR12GreasePencilE16LayerDrawingInfoZL34grease_pencil_do_layer_adjustmentsS4_E3$_1S5_EE+0x61>
101f32aa4:     	ldr	d1, [x8, #0xf08]
101f32aa8:     	fcmp	d0, d1
101f32aac:     	b.pl	0x101f32ae4 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x290>
101f32ab0:     	mov	x0, x20
101f32ab4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f32ab8:     	mov	x1, x0
101f32abc:     	ldr	x2, [x21, #0x10]
101f32ac0:     	adrp	x4, 0x101f38000 <__ZL17ui_apply_but_funcP8bContextP5uiBut+0x434>
101f32ac4:     	add	x4, x4, #0xbd0
101f32ac8:     	mov	x0, x20
101f32acc:     	mov	x3, x19
101f32ad0:     	bl	0x100b927f4 <__Z25WM_tooltip_immediate_initP8bContextP8wmWindowP7ScrAreaP7ARegionPFS6_S0_S6_PiPdPbE>
101f32ad4:     	ldr	x8, [x22, #0x218]
101f32ad8:     	cbz	x8, 0x101f32ae4 <__ZL20button_activate_initP8bContextP7ARegionP5uiBut20uiButtonActivateType+0x290>
101f32adc:     	mov	w9, #0x1                ; =1
101f32ae0:     	str	w9, [x8, #0x34]
101f32ae4:     	ldp	x29, x30, [sp, #0x40]
101f32ae8:     	ldp	x20, x19, [sp, #0x30]
101f32aec:     	ldp	x22, x21, [sp, #0x20]
101f32af0:     	ldp	x24, x23, [sp, #0x10]
101f32af4:     	ldp	d9, d8, [sp], #0x50
101f32af8:     	ret
