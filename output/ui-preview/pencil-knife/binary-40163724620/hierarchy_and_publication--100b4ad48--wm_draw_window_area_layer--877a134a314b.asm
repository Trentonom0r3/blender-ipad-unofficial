
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4ad48 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame>:
100b4ad48:     	sub	sp, sp, #0xa0
100b4ad4c:     	stp	x28, x27, [sp, #0x40]
100b4ad50:     	stp	x26, x25, [sp, #0x50]
100b4ad54:     	stp	x24, x23, [sp, #0x60]
100b4ad58:     	stp	x22, x21, [sp, #0x70]
100b4ad5c:     	stp	x20, x19, [sp, #0x80]
100b4ad60:     	stp	x29, x30, [sp, #0x90]
100b4ad64:     	add	x29, sp, #0x90
100b4ad68:     	mov	x19, x4
100b4ad6c:     	mov	x20, x3
100b4ad70:     	mov	x26, x2
100b4ad74:     	mov	x21, x1
100b4ad78:     	mov	x22, x0
100b4ad7c:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
100b4ad80:     	ldr	x8, [x8, #0x7f0]
100b4ad84:     	ldr	x8, [x8]
100b4ad88:     	str	x8, [sp, #0x38]
100b4ad8c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b4ad90:     	mov	x24, x0
100b4ad94:     	mov	x0, x21
100b4ad98:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b4ad9c:     	mov	x23, x0
100b4ada0:     	mov	x0, x21
100b4ada4:     	mov	x1, x23
100b4ada8:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b4adac:     	cbz	x0, 0x100b4aea0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x158>
100b4adb0:     	mov	x25, x0
100b4adb4:     	cmp	w26, #0x0
100b4adb8:     	cset	w26, gt
100b4adbc:     	b	0x100b4add4 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x8c>
100b4adc0:     	mov	x0, x23
100b4adc4:     	mov	x1, x25
100b4adc8:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b4adcc:     	mov	x25, x0
100b4add0:     	cbz	x0, 0x100b4aea0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x158>
100b4add4:     	tbnz	w20, #0x1f, 0x100b4adf4 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0xac>
100b4add8:     	mov	x0, x25
100b4addc:     	bl	0x10163634c <__Z27ED_ipad_panels_area_visiblePK7ScrArea>
100b4ade0:     	cbz	w0, 0x100b4adc0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x78>
100b4ade4:     	mov	x0, x25
100b4ade8:     	bl	0x10163635c <__Z25ED_ipad_panels_area_layerPK7ScrArea>
100b4adec:     	cmp	w0, w20
100b4adf0:     	b.ne	0x100b4adc0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x78>
100b4adf4:     	ldr	x27, [x25, #0x78]
100b4adf8:     	cbnz	x27, 0x100b4ae6c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x124>
100b4adfc:     	b	0x100b4adc0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x78>
100b4ae00:     	ldr	x0, [x8]
100b4ae04:     	ldr	w1, [x27, #0xa8]
100b4ae08:     	ldr	w2, [x27, #0xb0]
100b4ae0c:     	bl	0x1008f44d8 <__Z28GPU_offscreen_draw_to_screenP12GPUOffScreenii>
100b4ae10:     	ldur	q0, [x27, #0xa8]
100b4ae14:     	str	q0, [sp, #0x20]
100b4ae18:     	ldr	w8, [sp, #0x24]
100b4ae1c:     	ldr	w9, [sp, #0x2c]
100b4ae20:     	add	w8, w8, #0x1
100b4ae24:     	add	w9, w9, #0x1
100b4ae28:     	str	w8, [sp, #0x24]
100b4ae2c:     	str	w9, [sp, #0x2c]
100b4ae30:     	add	x4, sp, #0x20
100b4ae34:     	mov	x0, x22
100b4ae38:     	mov	x1, x21
100b4ae3c:     	mov	x2, x25
100b4ae40:     	mov	x3, x27
100b4ae44:     	bl	0x10163cd98 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti>
100b4ae48:     	add	x4, x27, #0xa8
100b4ae4c:     	mov	x0, x21
100b4ae50:     	mov	x1, x25
100b4ae54:     	mov	x2, x27
100b4ae58:     	mov	x3, x19
100b4ae5c:     	mov	w5, #0x0                ; =0
100b4ae60:     	bl	0x100b4b3ec <__ZL27wm_ipad_finger_paint_recordP8bContextP8wmWindowP7ScrAreaP7ARegionR22wmIPadFingerPaintFrameRK4rctib>
100b4ae64:     	ldr	x27, [x27]
100b4ae68:     	cbz	x27, 0x100b4adc0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x78>
100b4ae6c:     	ldr	x8, [x27, #0x128]
100b4ae70:     	ldrh	w9, [x8, #0x2b0]
100b4ae74:     	cbz	w9, 0x100b4ae64 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x11c>
100b4ae78:     	ldrh	w9, [x27, #0xca]
100b4ae7c:     	cbnz	w9, 0x100b4ae64 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x11c>
100b4ae80:     	ldr	x8, [x8, #0x298]
100b4ae84:     	cbz	x8, 0x100b4ae64 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x11c>
100b4ae88:     	ldr	x0, [x8, #0x8]
100b4ae8c:     	cbz	x0, 0x100b4ae00 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0xb8>
100b4ae90:     	add	x2, x27, #0xa8
100b4ae94:     	mov	x1, x26
100b4ae98:     	bl	0x100a6782c <__Z27GPU_viewport_draw_to_screenP11GPUViewportiPK4rcti>
100b4ae9c:     	b	0x100b4ae10 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0xc8>
100b4aea0:     	str	x19, [sp]
100b4aea4:     	mov	x0, x21
100b4aea8:     	mov	x1, x23
100b4aeac:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b4aeb0:     	cbz	x0, 0x100b4b17c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x434>
100b4aeb4:     	mov	x25, x0
100b4aeb8:     	str	w20, [sp, #0x8]
100b4aebc:     	b	0x100b4aed8 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x190>
100b4aec0:     	mov	x0, x23
100b4aec4:     	mov	x1, x25
100b4aec8:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b4aecc:     	mov	x25, x0
100b4aed0:     	ldr	w20, [sp, #0x8]
100b4aed4:     	cbz	x0, 0x100b4b17c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x434>
100b4aed8:     	tbnz	w20, #0x1f, 0x100b4aefc <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1b4>
100b4aedc:     	mov	x0, x25
100b4aee0:     	bl	0x10163634c <__Z27ED_ipad_panels_area_visiblePK7ScrArea>
100b4aee4:     	cbz	w0, 0x100b4aec0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x178>
100b4aee8:     	mov	x0, x25
100b4aeec:     	bl	0x10163635c <__Z25ED_ipad_panels_area_layerPK7ScrArea>
100b4aef0:     	ldr	w8, [sp, #0x8]
100b4aef4:     	cmp	w0, w8
100b4aef8:     	b.ne	0x100b4aec0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x178>
100b4aefc:     	ldr	x26, [x25, #0x78]
100b4af00:     	cbnz	x26, 0x100b4af28 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1e0>
100b4af04:     	b	0x100b4aec0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x178>
100b4af08:     	mov	x0, x22
100b4af0c:     	mov	x1, #0x0                ; =0
100b4af10:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4af14:     	mov	x0, x22
100b4af18:     	mov	x1, #0x0                ; =0
100b4af1c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b4af20:     	ldr	x26, [x26]
100b4af24:     	cbz	x26, 0x100b4aec0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x178>
100b4af28:     	ldr	x8, [x26, #0x128]
100b4af2c:     	ldrh	w9, [x8, #0x2b0]
100b4af30:     	cbz	w9, 0x100b4af20 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1d8>
100b4af34:     	ldr	x9, [x24, #0x5c0]
100b4af38:     	ldr	x9, [x9, #0x78]
100b4af3c:     	cbz	x9, 0x100b4af6c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x224>
100b4af40:     	ldr	x9, [x23, #0x1f8]
100b4af44:     	cmp	x26, x9
100b4af48:     	cset	w19, eq
100b4af4c:     	ldr	x8, [x8, #0xb8]
100b4af50:     	cbz	x8, 0x100b4af78 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x230>
100b4af54:     	ldr	x8, [x8, #0x38]
100b4af58:     	cmp	x8, #0x0
100b4af5c:     	cset	w20, ne
100b4af60:     	orr	w8, w19, w20
100b4af64:     	tbz	w8, #0x0, 0x100b4af20 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1d8>
100b4af68:     	b	0x100b4af84 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x23c>
100b4af6c:     	mov	w19, #0x0               ; =0
100b4af70:     	ldr	x8, [x8, #0xb8]
100b4af74:     	cbnz	x8, 0x100b4af54 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x20c>
100b4af78:     	mov	w20, #0x0               ; =0
100b4af7c:     	orr	w8, w19, w20
100b4af80:     	tbz	w8, #0x0, 0x100b4af20 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1d8>
100b4af84:     	mov	x0, x22
100b4af88:     	mov	x1, x25
100b4af8c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b4af90:     	mov	x0, x22
100b4af94:     	mov	x1, x26
100b4af98:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4af9c:     	cbz	w20, 0x100b4afe0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x298>
100b4afa0:     	mov	x0, x22
100b4afa4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b4afa8:     	mov	x27, x0
100b4afac:     	add	x0, x26, #0xa8
100b4afb0:     	bl	0x100b8f1b4 <__Z10wmViewportPK4rcti>
100b4afb4:     	ldrb	w0, [x25, #0x48]
100b4afb8:     	ldrsh	w1, [x26, #0xc0]
100b4afbc:     	bl	0x101faafbc <__Z11UI_SetThemeii>
100b4afc0:     	ldr	x8, [x26, #0x128]
100b4afc4:     	ldr	x8, [x8, #0xb8]
100b4afc8:     	ldr	x8, [x8, #0x38]
100b4afcc:     	mov	x0, x22
100b4afd0:     	mov	x1, x26
100b4afd4:     	blr	x8
100b4afd8:     	mov	x0, x27
100b4afdc:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b4afe0:     	cbz	w19, 0x100b4af08 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1c0>
100b4afe4:     	mov	x0, x22
100b4afe8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b4afec:     	mov	x28, x0
100b4aff0:     	mov	x0, x22
100b4aff4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b4aff8:     	mov	x27, x0
100b4affc:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b4b000:     	ldr	x8, [x28, #0x5c0]
100b4b004:     	ldrb	w9, [x8, #0x10]
100b4b008:     	tbnz	w9, #0x0, 0x100b4af08 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1c0>
100b4b00c:     	ldr	x9, [x26, #0x128]
100b4b010:     	ldrh	w9, [x9, #0x2b0]
100b4b014:     	cbz	w9, 0x100b4af08 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1c0>
100b4b018:     	ldr	x9, [x0, #0x1f8]
100b4b01c:     	cmp	x9, x26
100b4b020:     	b.ne	0x100b4af08 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1c0>
100b4b024:     	ldr	x19, [x8, #0x78]
100b4b028:     	cbnz	x19, 0x100b4b060 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x318>
100b4b02c:     	b	0x100b4af08 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1c0>
100b4b030:     	ldr	x8, [x28, #0x20]
100b4b034:     	ldr	d0, [x20]
100b4b038:     	str	d0, [sp, #0x20]
100b4b03c:     	ldr	x9, [x27, #0xf0]
100b4b040:     	ldr	x3, [x28, #0x10]
100b4b044:     	add	x1, sp, #0x20
100b4b048:     	add	x2, x9, #0x38
100b4b04c:     	mov	x0, x22
100b4b050:     	blr	x8
100b4b054:     	mov	w0, #0x0                ; =0
100b4b058:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4b05c:     	cbz	x19, 0x100b4af08 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x1c0>
100b4b060:     	mov	x28, x19
100b4b064:     	ldr	x19, [x19]
100b4b068:     	ldrsh	w8, [x28, #0x28]
100b4b06c:     	cmn	w8, #0x1
100b4b070:     	b.eq	0x100b4b080 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x338>
100b4b074:     	ldrb	w9, [x25, #0x48]
100b4b078:     	cmp	w9, w8
100b4b07c:     	b.ne	0x100b4b05c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x314>
100b4b080:     	ldrh	w8, [x28, #0x2a]
100b4b084:     	mov	w9, #0xffff             ; =65535
100b4b088:     	cmp	w8, w9
100b4b08c:     	b.eq	0x100b4b09c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x354>
100b4b090:     	ldrh	w9, [x26, #0xc0]
100b4b094:     	cmp	w8, w9
100b4b098:     	b.ne	0x100b4b05c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x314>
100b4b09c:     	ldr	x8, [x28, #0x18]
100b4b0a0:     	cbz	x8, 0x100b4b0b0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x368>
100b4b0a4:     	mov	x0, x22
100b4b0a8:     	blr	x8
100b4b0ac:     	cbz	w0, 0x100b4b05c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x314>
100b4b0b0:     	ldrb	w0, [x25, #0x48]
100b4b0b4:     	ldrsh	w1, [x26, #0xc0]
100b4b0b8:     	bl	0x101faafbc <__Z11UI_SetThemeii>
100b4b0bc:     	mov	w0, #0x1                ; =1
100b4b0c0:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4b0c4:     	ldp	w0, w8, [x26, #0xa8]
100b4b0c8:     	sub	w8, w8, w0
100b4b0cc:     	ldp	w1, w9, [x26, #0xb0]
100b4b0d0:     	sub	w9, w9, w1
100b4b0d4:     	add	w2, w8, #0x1
100b4b0d8:     	add	w3, w9, #0x1
100b4b0dc:     	bl	0x100a62280 <__Z11GPU_scissoriiii>
100b4b0e0:     	ldr	x8, [x27, #0xf0]
100b4b0e4:     	add	x20, x8, #0x14
100b4b0e8:     	bl	0x100b94dc4 <__Z20WM_capabilities_flagv>
100b4b0ec:     	tbz	w0, #0x0, 0x100b4b160 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x418>
100b4b0f0:     	ldrh	w8, [x27, #0xd4]
100b4b0f4:     	and	w8, w8, #0xfffe
100b4b0f8:     	cmp	w8, #0x2
100b4b0fc:     	b.ne	0x100b4b160 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x418>
100b4b100:     	stp	xzr, xzr, [sp, #0x20]
100b4b104:     	strb	wzr, [sp, #0xf]
100b4b108:     	ldr	x0, [x27, #0x10]
100b4b10c:     	add	x1, sp, #0x14
100b4b110:     	add	x2, sp, #0x10
100b4b114:     	add	x3, sp, #0x20
100b4b118:     	add	x4, sp, #0xf
100b4b11c:     	bl	0x101094b50 <_GHOST_GetCursorGrabState>
100b4b120:     	ldr	w8, [sp, #0x20]
100b4b124:     	ldr	w9, [sp, #0x28]
100b4b128:     	cmp	w8, w9
100b4b12c:     	b.ne	0x100b4b140 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x3f8>
100b4b130:     	ldr	w8, [sp, #0x24]
100b4b134:     	ldr	w9, [sp, #0x2c]
100b4b138:     	cmp	w8, w9
100b4b13c:     	b.eq	0x100b4b160 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x418>
100b4b140:     	add	x1, sp, #0x18
100b4b144:     	add	x8, sp, #0x18
100b4b148:     	add	x2, x8, #0x4
100b4b14c:     	mov	x0, x27
100b4b150:     	bl	0x100b94f64 <__Z22wm_cursor_position_getP8wmWindowPiS1_>
100b4b154:     	cmp	w0, #0x0
100b4b158:     	add	x8, sp, #0x18
100b4b15c:     	csel	x20, x8, x20, ne
100b4b160:     	mov	x0, x28
100b4b164:     	bl	0x101d92f70 <__Z27ED_ipad_native_brush_cursorPK13wmPaintCursor>
100b4b168:     	tbnz	w0, #0x0, 0x100b4b030 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x2e8>
100b4b16c:     	ldr	x8, [x26, #0x128]
100b4b170:     	mov	w9, #0x1                ; =1
100b4b174:     	strb	w9, [x8, #0x1]
100b4b178:     	b	0x100b4b030 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x2e8>
100b4b17c:     	mov	x0, x21
100b4b180:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b4b184:     	mov	x0, x21
100b4b188:     	mov	x1, x23
100b4b18c:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b4b190:     	ldr	x19, [sp]
100b4b194:     	cbz	x0, 0x100b4b27c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x534>
100b4b198:     	mov	x24, x0
100b4b19c:     	b	0x100b4b1b4 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x46c>
100b4b1a0:     	mov	x0, x23
100b4b1a4:     	mov	x1, x24
100b4b1a8:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b4b1ac:     	mov	x24, x0
100b4b1b0:     	cbz	x0, 0x100b4b27c <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x534>
100b4b1b4:     	tbnz	w20, #0x1f, 0x100b4b1d4 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x48c>
100b4b1b8:     	mov	x0, x24
100b4b1bc:     	bl	0x10163634c <__Z27ED_ipad_panels_area_visiblePK7ScrArea>
100b4b1c0:     	cbz	w0, 0x100b4b1a0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x458>
100b4b1c4:     	mov	x0, x24
100b4b1c8:     	bl	0x10163635c <__Z25ED_ipad_panels_area_layerPK7ScrArea>
100b4b1cc:     	cmp	w0, w20
100b4b1d0:     	b.ne	0x100b4b1a0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x458>
100b4b1d4:     	ldr	x25, [x24, #0x78]
100b4b1d8:     	cbnz	x25, 0x100b4b1e8 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x4a0>
100b4b1dc:     	b	0x100b4b1a0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x458>
100b4b1e0:     	ldr	x25, [x25]
100b4b1e4:     	cbz	x25, 0x100b4b1a0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x458>
100b4b1e8:     	ldr	x8, [x25, #0x128]
100b4b1ec:     	ldrh	w8, [x8, #0x2b0]
100b4b1f0:     	cbz	w8, 0x100b4b1e0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x498>
100b4b1f4:     	ldrh	w8, [x25, #0xca]
100b4b1f8:     	cbz	w8, 0x100b4b1e0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x498>
100b4b1fc:     	add	x3, sp, #0x20
100b4b200:     	mov	x0, x25
100b4b204:     	mov	w1, #0x0                ; =0
100b4b208:     	mov	w2, #0x1                ; =1
100b4b20c:     	bl	0x100b48214 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti>
100b4b210:     	cbz	w0, 0x100b4b1e0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x498>
100b4b214:     	add	x4, sp, #0x20
100b4b218:     	mov	x0, x22
100b4b21c:     	mov	x1, x21
100b4b220:     	mov	x2, x24
100b4b224:     	mov	x3, x25
100b4b228:     	bl	0x10163c584 <__Z29ED_ipad_hud_compositor_recordP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti>
100b4b22c:     	add	x4, sp, #0x20
100b4b230:     	mov	x0, x22
100b4b234:     	mov	x1, x21
100b4b238:     	mov	x2, x24
100b4b23c:     	mov	x3, x25
100b4b240:     	bl	0x10163cd98 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti>
100b4b244:     	ldr	w8, [sp, #0x24]
100b4b248:     	ldr	w9, [sp, #0x2c]
100b4b24c:     	sub	w8, w8, #0x1
100b4b250:     	sub	w9, w9, #0x1
100b4b254:     	str	w8, [sp, #0x24]
100b4b258:     	str	w9, [sp, #0x2c]
100b4b25c:     	add	x4, sp, #0x20
100b4b260:     	mov	x0, x21
100b4b264:     	mov	x1, x24
100b4b268:     	mov	x2, x25
100b4b26c:     	mov	x3, x19
100b4b270:     	mov	w5, #0x1                ; =1
100b4b274:     	bl	0x100b4b3ec <__ZL27wm_ipad_finger_paint_recordP8bContextP8wmWindowP7ScrAreaP7ARegionR22wmIPadFingerPaintFrameRK4rctib>
100b4b278:     	b	0x100b4b1e0 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x498>
100b4b27c:     	ldr	x8, [sp, #0x38]
100b4b280:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
100b4b284:     	ldr	x9, [x9, #0x7f0]
100b4b288:     	ldr	x9, [x9]
100b4b28c:     	cmp	x9, x8
100b4b290:     	b.ne	0x100b4b2b4 <__ZL25wm_draw_window_area_layerP8bContextP8wmWindowiiR22wmIPadFingerPaintFrame+0x56c>
100b4b294:     	ldp	x29, x30, [sp, #0x90]
100b4b298:     	ldp	x20, x19, [sp, #0x80]
100b4b29c:     	ldp	x22, x21, [sp, #0x70]
100b4b2a0:     	ldp	x24, x23, [sp, #0x60]
100b4b2a4:     	ldp	x26, x25, [sp, #0x50]
100b4b2a8:     	ldp	x28, x27, [sp, #0x40]
100b4b2ac:     	add	sp, sp, #0xa0
100b4b2b0:     	ret
100b4b2b4:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
