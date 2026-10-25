
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4be68 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab>:
100b4be68:     	stp	d9, d8, [sp, #-0x70]!
100b4be6c:     	stp	x28, x27, [sp, #0x10]
100b4be70:     	stp	x26, x25, [sp, #0x20]
100b4be74:     	stp	x24, x23, [sp, #0x30]
100b4be78:     	stp	x22, x21, [sp, #0x40]
100b4be7c:     	stp	x20, x19, [sp, #0x50]
100b4be80:     	stp	x29, x30, [sp, #0x60]
100b4be84:     	add	x29, sp, #0x60
100b4be88:     	sub	sp, sp, #0x210
100b4be8c:     	str	w3, [sp, #0x24]
100b4be90:     	mov	x21, x2
100b4be94:     	mov	x22, x1
100b4be98:     	mov	x19, x0
100b4be9c:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
100b4bea0:     	ldr	x8, [x8, #0x7f0]
100b4bea4:     	ldr	x8, [x8]
100b4bea8:     	stur	x8, [x29, #-0x70]
100b4beac:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b4beb0:     	mov	x20, x0
100b4beb4:     	mov	x0, x19
100b4beb8:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b4bebc:     	str	x0, [sp, #0x28]
100b4bec0:     	mov	x0, x19
100b4bec4:     	mov	x1, x21
100b4bec8:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b4becc:     	ldrh	w8, [x21, #0x52]
100b4bed0:     	tbz	w8, #0x4, 0x100b4bf34 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0xcc>
100b4bed4:     	ldrb	w9, [x21, #0x48]
100b4bed8:     	mov	w10, #0x1               ; =1
100b4bedc:     	lsl	w9, w10, w9
100b4bee0:     	mov	w10, #0x142             ; =322
100b4bee4:     	movk	w10, #0x1, lsl #16
100b4bee8:     	tst	w9, w10
100b4beec:     	b.eq	0x100b4bf2c <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0xc4>
100b4bef0:     	mov	x0, x19
100b4bef4:     	bl	0x1000b43e0 <__Z16CTX_wm_workspacePK8bContext>
100b4bef8:     	mov	x23, x0
100b4befc:     	mov	x0, x19
100b4bf00:     	bl	0x1000b4e44 <__Z14CTX_data_scenePK8bContext>
100b4bf04:     	mov	x24, x0
100b4bf08:     	mov	x0, x19
100b4bf0c:     	bl	0x1000b4ef0 <__Z19CTX_data_view_layerPK8bContext>
100b4bf10:     	mov	x3, x0
100b4bf14:     	mov	x0, x19
100b4bf18:     	mov	x1, x23
100b4bf1c:     	mov	x2, x24
100b4bf20:     	mov	x4, x21
100b4bf24:     	bl	0x100b91ca8 <__Z33WM_toolsystem_update_from_contextP8bContextP9WorkSpacePK5SceneP9ViewLayerP7ScrArea>
100b4bf28:     	ldrh	w8, [x21, #0x52]
100b4bf2c:     	and	w8, w8, #0xffffffef
100b4bf30:     	strh	w8, [x21, #0x52]
100b4bf34:     	mov	x0, x19
100b4bf38:     	mov	x1, x21
100b4bf3c:     	bl	0x101f8d9a4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>
100b4bf40:     	ldrb	w8, [x21, #0x48]
100b4bf44:     	cmp	x8, #0x16
100b4bf48:     	b.hi	0x100b4bf5c <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0xf4>
100b4bf4c:     	adrp	x9, 0x1063a1000 <_IMB_FILE_TYPES+0x68>
100b4bf50:     	add	x9, x9, #0xda8
100b4bf54:     	ldr	x0, [x9, x8, lsl #3]
100b4bf58:     	b	0x100b4bf64 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0xfc>
100b4bf5c:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b4bf60:     	add	x0, x0, #0x44a
100b4bf64:     	bl	0x1008f2fe0 <__Z21GPU_debug_group_beginPKc>
100b4bf68:     	ldr	x23, [x21, #0x78]
100b4bf6c:     	cbnz	x23, 0x100b4bfe8 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x180>
100b4bf70:     	mov	x0, x19
100b4bf74:     	mov	x1, x21
100b4bf78:     	bl	0x101f8d9a4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>
100b4bf7c:     	mov	x0, x20
100b4bf80:     	mov	x1, x22
100b4bf84:     	mov	x2, x21
100b4bf88:     	bl	0x10162069c <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
100b4bf8c:     	ldr	x24, [x21, #0x78]
100b4bf90:     	cbnz	x24, 0x100b4c090 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x228>
100b4bf94:     	mov	x0, x19
100b4bf98:     	mov	x1, #0x0                ; =0
100b4bf9c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b4bfa0:     	bl	0x1008f30ac <__Z19GPU_debug_group_endv>
100b4bfa4:     	ldur	x8, [x29, #-0x70]
100b4bfa8:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
100b4bfac:     	ldr	x9, [x9, #0x7f0]
100b4bfb0:     	ldr	x9, [x9]
100b4bfb4:     	cmp	x9, x8
100b4bfb8:     	b.ne	0x100b4c708 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x8a0>
100b4bfbc:     	add	sp, sp, #0x210
100b4bfc0:     	ldp	x29, x30, [sp, #0x60]
100b4bfc4:     	ldp	x20, x19, [sp, #0x50]
100b4bfc8:     	ldp	x22, x21, [sp, #0x40]
100b4bfcc:     	ldp	x24, x23, [sp, #0x30]
100b4bfd0:     	ldp	x26, x25, [sp, #0x20]
100b4bfd4:     	ldp	x28, x27, [sp, #0x10]
100b4bfd8:     	ldp	d9, d8, [sp], #0x70
100b4bfdc:     	ret
100b4bfe0:     	ldr	x23, [x23]
100b4bfe4:     	cbz	x23, 0x100b4bf70 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x108>
100b4bfe8:     	ldrh	w8, [x23, #0xc4]
100b4bfec:     	tbnz	w8, #0xa, 0x100b4bfe0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x178>
100b4bff0:     	and	w9, w8, #0x7
100b4bff4:     	ldr	x8, [x23, #0x128]
100b4bff8:     	ldrh	w10, [x8, #0x2b0]
100b4bffc:     	cmp	w9, #0x6
100b4c000:     	ccmp	w10, #0x0, #0x0, ne
100b4c004:     	b.eq	0x100b4bfe0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x178>
100b4c008:     	ldrh	w9, [x8, #0x2b2]
100b4c00c:     	cbz	w9, 0x100b4bfe0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x178>
100b4c010:     	ldr	x8, [x8, #0xb8]
100b4c014:     	cbz	x8, 0x100b4bfe0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x178>
100b4c018:     	ldr	x8, [x8, #0x40]
100b4c01c:     	cbz	x8, 0x100b4bfe0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x178>
100b4c020:     	mov	x0, x19
100b4c024:     	mov	x1, x23
100b4c028:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4c02c:     	mov	x0, x19
100b4c030:     	mov	x1, x22
100b4c034:     	mov	x2, x21
100b4c038:     	mov	x3, x23
100b4c03c:     	bl	0x10163a89c <__Z24ED_ipad_hud_layout_beginP8bContextP8wmWindowP7ScrAreaP7ARegion>
100b4c040:     	mov	x0, x19
100b4c044:     	mov	x1, x23
100b4c048:     	bl	0x10161e5e4 <__Z19ED_region_do_layoutP8bContextP7ARegion>
100b4c04c:     	mov	x0, x19
100b4c050:     	mov	x1, x22
100b4c054:     	mov	x2, x21
100b4c058:     	mov	x3, x23
100b4c05c:     	bl	0x10163b254 <__Z22ED_ipad_hud_layout_endP8bContextP8wmWindowP7ScrAreaP7ARegion>
100b4c060:     	mov	x0, x19
100b4c064:     	mov	x1, #0x0                ; =0
100b4c068:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4c06c:     	b	0x100b4bfe0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x178>
100b4c070:     	bl	0x1008f30ac <__Z19GPU_debug_group_endv>
100b4c074:     	ldr	x8, [x24, #0x128]
100b4c078:     	strh	wzr, [x8, #0x2b2]
100b4c07c:     	mov	x0, x19
100b4c080:     	mov	x1, #0x0                ; =0
100b4c084:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4c088:     	ldr	x24, [x24]
100b4c08c:     	cbz	x24, 0x100b4bf94 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x12c>
100b4c090:     	ldr	x8, [x24, #0x128]
100b4c094:     	ldrh	w9, [x8, #0x2b0]
100b4c098:     	cbz	w9, 0x100b4c088 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x220>
100b4c09c:     	ldrh	w8, [x8, #0x2b2]
100b4c0a0:     	cbz	w8, 0x100b4c088 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x220>
100b4c0a4:     	mov	x0, x19
100b4c0a8:     	mov	x1, x24
100b4c0ac:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4c0b0:     	ldrb	w9, [x21, #0x48]
100b4c0b4:     	cmp	w9, #0x1
100b4c0b8:     	ldrh	w8, [x24, #0xc0]
100b4c0bc:     	ccmp	w9, #0x6, #0x4, ne
100b4c0c0:     	ccmp	w9, #0x10, #0x4, ne
100b4c0c4:     	cset	w10, eq
100b4c0c8:     	cbnz	w8, 0x100b4c0e0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x278>
100b4c0cc:     	tbz	w10, #0x0, 0x100b4c0e0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x278>
100b4c0d0:     	mov	w23, #0x1               ; =1
100b4c0d4:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b4c0d8:     	add	x0, x0, #0x349
100b4c0dc:     	b	0x100b4c100 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x298>
100b4c0e0:     	cmp	w9, #0x8
100b4c0e4:     	b.ne	0x100b4c0f4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x28c>
100b4c0e8:     	cmp	w8, #0x0
100b4c0ec:     	ccmp	w8, #0x7, #0x4, ne
100b4c0f0:     	b.eq	0x100b4c0d0 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x268>
100b4c0f4:     	mov	w23, #0x0               ; =0
100b4c0f8:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b4c0fc:     	add	x0, x0, #0x352
100b4c100:     	bl	0x1008f2fe0 <__Z21GPU_debug_group_beginPKc>
100b4c104:     	movi.16b	v0, #0x0
100b4c108:     	add	x8, sp, #0xea
100b4c10c:     	stur	q0, [x8, #0xff]
100b4c110:     	stp	q0, q0, [sp, #0x1d0]
100b4c114:     	stp	q0, q0, [sp, #0x1b0]
100b4c118:     	stp	q0, q0, [sp, #0x190]
100b4c11c:     	stp	q0, q0, [sp, #0x170]
100b4c120:     	stp	q0, q0, [sp, #0x150]
100b4c124:     	stp	q0, q0, [sp, #0x130]
100b4c128:     	str	q0, [sp, #0x120]
100b4c12c:     	mov	x27, x24
100b4c130:     	ldp	w9, w8, [x27, #0xa8]!
100b4c134:     	stp	w8, w9, [sp, #0x1c]
100b4c138:     	ldp	w9, w8, [x27, #0x8]
100b4c13c:     	stp	w8, w9, [sp, #0x14]
100b4c140:     	ldr	x8, [x27, #0x80]
100b4c144:     	ldp	w10, w9, [x8, #0xa0]
100b4c148:     	stp	w9, w10, [sp, #0xc]
100b4c14c:     	ldp	w10, w9, [x8, #0xa8]
100b4c150:     	stp	w9, w10, [sp, #0x4]
100b4c154:     	ldrb	w25, [x8, #0x8]
100b4c158:     	mov	x0, x22
100b4c15c:     	bl	0x100b96a54 <__Z24WM_window_native_pixel_xPK8wmWindow>
100b4c160:     	mov	x20, x0
100b4c164:     	mov	x0, x22
100b4c168:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
100b4c16c:     	mov	x28, x0
100b4c170:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b4c174:     	add	x8, x8, #0xe08
100b4c178:     	ldr	s8, [x8, #0x2654]
100b4c17c:     	ldr	x8, [x27, #0x80]
100b4c180:     	ldrh	w26, [x8, #0x2b2]
100b4c184:     	add	x1, sp, #0x120
100b4c188:     	mov	x0, x19
100b4c18c:     	bl	0x10163f3f8 <__Z28ED_ipad_finger_paint_captureP8bContextR20IPadFingerPaintOwner>
100b4c190:     	ldr	x8, [x27, #0x80]
100b4c194:     	strb	wzr, [x8, #0x1]
100b4c198:     	ldr	x8, [x27, #0x80]
100b4c19c:     	strb	wzr, [x8, #0x2]
100b4c1a0:     	ldr	w8, [sp, #0x24]
100b4c1a4:     	cbz	w8, 0x100b4c1fc <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x394>
100b4c1a8:     	ldr	x0, [sp, #0x28]
100b4c1ac:     	mov	x1, x21
100b4c1b0:     	mov	x2, x24
100b4c1b4:     	mov	w3, #0x0                ; =0
100b4c1b8:     	bl	0x100b4c70c <__ZL25wm_draw_region_stereo_setP4MainP7ScrAreaP7ARegion12eStereoViews>
100b4c1bc:     	cbz	w0, 0x100b4c1fc <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x394>
100b4c1c0:     	mov	x0, x22
100b4c1c4:     	bl	0x100b94c9c <__Z26WM_window_get_active_scenePK8wmWindow>
100b4c1c8:     	mov	x1, x24
100b4c1cc:     	mov	w2, #0x1                ; =1
100b4c1d0:     	mov	x3, x23
100b4c1d4:     	bl	0x100b4a994 <__ZL28wm_draw_region_buffer_createP5SceneP7ARegionbb>
100b4c1d8:     	ldr	x8, [x24, #0x128]
100b4c1dc:     	ldr	x8, [x8, #0x298]
100b4c1e0:     	cbz	x8, 0x100b4c308 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x4a0>
100b4c1e4:     	ldr	x0, [x8, #0x8]
100b4c1e8:     	cbz	x0, 0x100b4c2d4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x46c>
100b4c1ec:     	mov	w1, #0x0                ; =0
100b4c1f0:     	mov	x2, x27
100b4c1f4:     	bl	0x100a66dc0 <__Z17GPU_viewport_bindP11GPUViewportiPK4rcti>
100b4c1f8:     	b	0x100b4c2fc <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x494>
100b4c1fc:     	ldr	x0, [sp, #0x28]
100b4c200:     	mov	x1, x21
100b4c204:     	mov	x2, x24
100b4c208:     	mov	w3, #0x0                ; =0
100b4c20c:     	bl	0x100b4c70c <__ZL25wm_draw_region_stereo_setP4MainP7ScrAreaP7ARegion12eStereoViews>
100b4c210:     	mov	x0, x22
100b4c214:     	bl	0x100b94c9c <__Z26WM_window_get_active_scenePK8wmWindow>
100b4c218:     	mov	x1, x24
100b4c21c:     	mov	w2, #0x0                ; =0
100b4c220:     	mov	x3, x23
100b4c224:     	bl	0x100b4a994 <__ZL28wm_draw_region_buffer_createP5SceneP7ARegionbb>
100b4c228:     	ldr	x8, [x24, #0x128]
100b4c22c:     	ldr	x8, [x8, #0x298]
100b4c230:     	cbz	x8, 0x100b4c280 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x418>
100b4c234:     	ldr	x0, [x8, #0x8]
100b4c238:     	cbz	x0, 0x100b4c24c <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x3e4>
100b4c23c:     	mov	w1, #0x0                ; =0
100b4c240:     	mov	x2, x27
100b4c244:     	bl	0x100a66dc0 <__Z17GPU_viewport_bindP11GPUViewportiPK4rcti>
100b4c248:     	b	0x100b4c274 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x40c>
100b4c24c:     	ldr	x0, [x8]
100b4c250:     	mov	w1, #0x0                ; =0
100b4c254:     	bl	0x1008f441c <__Z18GPU_offscreen_bindP12GPUOffScreenb>
100b4c258:     	mov	w0, #0x1                ; =1
100b4c25c:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4c260:     	ldrsh	w2, [x24, #0xb8]
100b4c264:     	ldrsh	w3, [x24, #0xba]
100b4c268:     	mov	w0, #0x0                ; =0
100b4c26c:     	mov	w1, #0x0                ; =0
100b4c270:     	bl	0x100a62280 <__Z11GPU_scissoriiii>
100b4c274:     	ldr	x8, [x24, #0x128]
100b4c278:     	ldr	x8, [x8, #0x298]
100b4c27c:     	str	wzr, [x8, #0x14]
100b4c280:     	mov	x0, x19
100b4c284:     	mov	x1, x24
100b4c288:     	bl	0x10161e688 <__Z17ED_region_do_drawP8bContextP7ARegion>
100b4c28c:     	ldr	x8, [x24, #0x128]
100b4c290:     	ldr	x8, [x8, #0x298]
100b4c294:     	cbz	x8, 0x100b4c414 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x5ac>
100b4c298:     	mov	w9, #-0x1               ; =-1
100b4c29c:     	str	w9, [x8, #0x14]
100b4c2a0:     	ldr	x8, [x24, #0x128]
100b4c2a4:     	ldr	x8, [x8, #0x298]
100b4c2a8:     	ldr	x0, [x8, #0x8]
100b4c2ac:     	cbz	x0, 0x100b4c2b8 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x450>
100b4c2b0:     	bl	0x100a678c8 <__Z19GPU_viewport_unbindP11GPUViewport>
100b4c2b4:     	b	0x100b4c414 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x5ac>
100b4c2b8:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4c2bc:     	ldr	x8, [x24, #0x128]
100b4c2c0:     	ldr	x8, [x8, #0x298]
100b4c2c4:     	ldr	x0, [x8]
100b4c2c8:     	mov	w1, #0x0                ; =0
100b4c2cc:     	bl	0x1008f4480 <__Z20GPU_offscreen_unbindP12GPUOffScreenb>
100b4c2d0:     	b	0x100b4c414 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x5ac>
100b4c2d4:     	ldr	x0, [x8]
100b4c2d8:     	mov	w1, #0x0                ; =0
100b4c2dc:     	bl	0x1008f441c <__Z18GPU_offscreen_bindP12GPUOffScreenb>
100b4c2e0:     	mov	w0, #0x1                ; =1
100b4c2e4:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4c2e8:     	ldrsh	w2, [x24, #0xb8]
100b4c2ec:     	ldrsh	w3, [x24, #0xba]
100b4c2f0:     	mov	w0, #0x0                ; =0
100b4c2f4:     	mov	w1, #0x0                ; =0
100b4c2f8:     	bl	0x100a62280 <__Z11GPU_scissoriiii>
100b4c2fc:     	ldr	x8, [x24, #0x128]
100b4c300:     	ldr	x8, [x8, #0x298]
100b4c304:     	str	wzr, [x8, #0x14]
100b4c308:     	mov	x0, x19
100b4c30c:     	mov	x1, x24
100b4c310:     	bl	0x10161e688 <__Z17ED_region_do_drawP8bContextP7ARegion>
100b4c314:     	ldr	x8, [x24, #0x128]
100b4c318:     	ldr	x8, [x8, #0x298]
100b4c31c:     	cbz	x8, 0x100b4c358 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x4f0>
100b4c320:     	mov	w9, #-0x1               ; =-1
100b4c324:     	str	w9, [x8, #0x14]
100b4c328:     	ldr	x8, [x24, #0x128]
100b4c32c:     	ldr	x8, [x8, #0x298]
100b4c330:     	ldr	x0, [x8, #0x8]
100b4c334:     	cbz	x0, 0x100b4c340 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x4d8>
100b4c338:     	bl	0x100a678c8 <__Z19GPU_viewport_unbindP11GPUViewport>
100b4c33c:     	b	0x100b4c358 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x4f0>
100b4c340:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4c344:     	ldr	x8, [x24, #0x128]
100b4c348:     	ldr	x8, [x8, #0x298]
100b4c34c:     	ldr	x0, [x8]
100b4c350:     	mov	w1, #0x0                ; =0
100b4c354:     	bl	0x1008f4480 <__Z20GPU_offscreen_unbindP12GPUOffScreenb>
100b4c358:     	ldr	x0, [sp, #0x28]
100b4c35c:     	mov	x1, x21
100b4c360:     	mov	x2, x24
100b4c364:     	mov	w3, #0x1                ; =1
100b4c368:     	bl	0x100b4c70c <__ZL25wm_draw_region_stereo_setP4MainP7ScrAreaP7ARegion12eStereoViews>
100b4c36c:     	ldr	x8, [x24, #0x128]
100b4c370:     	ldr	x8, [x8, #0x298]
100b4c374:     	cbz	x8, 0x100b4c3c8 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x560>
100b4c378:     	ldr	x0, [x8, #0x8]
100b4c37c:     	cbz	x0, 0x100b4c390 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x528>
100b4c380:     	mov	w1, #0x1                ; =1
100b4c384:     	mov	x2, x27
100b4c388:     	bl	0x100a66dc0 <__Z17GPU_viewport_bindP11GPUViewportiPK4rcti>
100b4c38c:     	b	0x100b4c3b8 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x550>
100b4c390:     	ldr	x0, [x8]
100b4c394:     	mov	w1, #0x0                ; =0
100b4c398:     	bl	0x1008f441c <__Z18GPU_offscreen_bindP12GPUOffScreenb>
100b4c39c:     	mov	w0, #0x1                ; =1
100b4c3a0:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4c3a4:     	ldrsh	w2, [x24, #0xb8]
100b4c3a8:     	ldrsh	w3, [x24, #0xba]
100b4c3ac:     	mov	w0, #0x0                ; =0
100b4c3b0:     	mov	w1, #0x0                ; =0
100b4c3b4:     	bl	0x100a62280 <__Z11GPU_scissoriiii>
100b4c3b8:     	ldr	x8, [x24, #0x128]
100b4c3bc:     	ldr	x8, [x8, #0x298]
100b4c3c0:     	mov	w9, #0x1                ; =1
100b4c3c4:     	str	w9, [x8, #0x14]
100b4c3c8:     	mov	x0, x19
100b4c3cc:     	mov	x1, x24
100b4c3d0:     	bl	0x10161e688 <__Z17ED_region_do_drawP8bContextP7ARegion>
100b4c3d4:     	ldr	x8, [x24, #0x128]
100b4c3d8:     	ldr	x8, [x8, #0x298]
100b4c3dc:     	cbz	x8, 0x100b4c3fc <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x594>
100b4c3e0:     	mov	w9, #-0x1               ; =-1
100b4c3e4:     	str	w9, [x8, #0x14]
100b4c3e8:     	ldr	x8, [x24, #0x128]
100b4c3ec:     	ldr	x8, [x8, #0x298]
100b4c3f0:     	ldr	x0, [x8, #0x8]
100b4c3f4:     	cbz	x0, 0x100b4c5f8 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x790>
100b4c3f8:     	bl	0x100a678c8 <__Z19GPU_viewport_unbindP11GPUViewport>
100b4c3fc:     	cbz	w23, 0x100b4c414 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x5ac>
100b4c400:     	ldr	x8, [x24, #0x128]
100b4c404:     	ldr	x8, [x8, #0x298]
100b4c408:     	ldr	x0, [x8, #0x8]
100b4c40c:     	ldr	x1, [x22, #0x138]
100b4c410:     	bl	0x100a67204 <__Z29GPU_viewport_stereo_compositeP11GPUViewportP14Stereo3dFormat>
100b4c414:     	mov	x0, x19
100b4c418:     	mov	x1, x22
100b4c41c:     	mov	x2, x21
100b4c420:     	mov	x3, x24
100b4c424:     	bl	0x10163b4d4 <__Z20ED_ipad_hud_draw_endP8bContextP8wmWindowP7ScrAreaP7ARegion>
100b4c428:     	movi.16b	v0, #0x0
100b4c42c:     	add	x8, sp, #0xa
100b4c430:     	stur	q0, [x8, #0xff]
100b4c434:     	stp	q0, q0, [sp, #0xf0]
100b4c438:     	stp	q0, q0, [sp, #0xd0]
100b4c43c:     	stp	q0, q0, [sp, #0xb0]
100b4c440:     	stp	q0, q0, [sp, #0x90]
100b4c444:     	stp	q0, q0, [sp, #0x70]
100b4c448:     	stp	q0, q0, [sp, #0x50]
100b4c44c:     	str	q0, [sp, #0x40]
100b4c450:     	add	x1, sp, #0x40
100b4c454:     	mov	x0, x19
100b4c458:     	bl	0x10163f3f8 <__Z28ED_ipad_finger_paint_captureP8bContextR20IPadFingerPaintOwner>
100b4c45c:     	ldr	x8, [x24, #0x128]
100b4c460:     	ldr	x23, [x8, #0x298]
100b4c464:     	cbz	x23, 0x100b4c070 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x208>
100b4c468:     	str	xzr, [x23, #0x18]
100b4c46c:     	ldrb	w8, [sp, #0x1f8]
100b4c470:     	cmp	w8, #0x1
100b4c474:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c478:     	ldrb	w8, [sp, #0x118]
100b4c47c:     	cmp	w8, #0x1
100b4c480:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c484:     	ldrb	w8, [x23, #0x10]
100b4c488:     	tbnz	w8, #0x0, 0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c48c:     	tbnz	w26, #0x1, 0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c490:     	cbz	w25, 0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c494:     	ldr	x8, [x24, #0x128]
100b4c498:     	ldrb	w8, [x8, #0x8]
100b4c49c:     	cmp	w8, #0x1
100b4c4a0:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c4a4:     	mov	x0, x22
100b4c4a8:     	bl	0x100b96a54 <__Z24WM_window_native_pixel_xPK8wmWindow>
100b4c4ac:     	cmp	w20, w0
100b4c4b0:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c4b4:     	mov	x0, x22
100b4c4b8:     	bl	0x100b96a8c <__Z24WM_window_native_pixel_yPK8wmWindow>
100b4c4bc:     	cmp	w28, w0
100b4c4c0:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c4c4:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b4c4c8:     	add	x8, x8, #0xe08
100b4c4cc:     	ldr	s0, [x8, #0x2654]
100b4c4d0:     	fcmp	s8, s0
100b4c4d4:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c4d8:     	ldr	w8, [x27]
100b4c4dc:     	ldr	w9, [sp, #0x20]
100b4c4e0:     	cmp	w9, w8
100b4c4e4:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c4e8:     	ldr	w8, [x24, #0xac]
100b4c4ec:     	ldr	w9, [sp, #0x1c]
100b4c4f0:     	cmp	w9, w8
100b4c4f4:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c4f8:     	ldr	w8, [x24, #0xb0]
100b4c4fc:     	ldr	w9, [sp, #0x18]
100b4c500:     	cmp	w9, w8
100b4c504:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c508:     	ldr	w8, [x24, #0xb4]
100b4c50c:     	ldr	w9, [sp, #0x14]
100b4c510:     	cmp	w9, w8
100b4c514:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c518:     	ldr	x8, [x24, #0x128]
100b4c51c:     	mov	x20, x8
100b4c520:     	ldr	w9, [x20, #0xa0]!
100b4c524:     	ldr	w10, [sp, #0x10]
100b4c528:     	cmp	w10, w9
100b4c52c:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c530:     	ldr	w9, [x8, #0xa4]
100b4c534:     	ldr	w10, [sp, #0xc]
100b4c538:     	cmp	w10, w9
100b4c53c:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c540:     	ldr	w9, [x8, #0xa8]
100b4c544:     	ldr	w10, [sp, #0x8]
100b4c548:     	cmp	w10, w9
100b4c54c:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c550:     	ldr	w8, [x8, #0xac]
100b4c554:     	ldr	w9, [sp, #0x4]
100b4c558:     	cmp	w9, w8
100b4c55c:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c560:     	add	x0, sp, #0x120
100b4c564:     	add	x1, sp, #0x40
100b4c568:     	mov	w2, #0x98               ; =152
100b4c56c:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
100b4c570:     	cbnz	w0, 0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c574:     	ldp	x8, x9, [sp, #0x1b8]
100b4c578:     	ldp	x10, x11, [sp, #0xd8]
100b4c57c:     	ldp	x12, x13, [sp, #0x1c8]
100b4c580:     	ldp	x14, x15, [sp, #0xe8]
100b4c584:     	ldp	x16, x17, [sp, #0x1d8]
100b4c588:     	ldp	x0, x1, [sp, #0xf8]
100b4c58c:     	ldp	x2, x3, [sp, #0x1e8]
100b4c590:     	ldp	x4, x5, [sp, #0x108]
100b4c594:     	cmp	x8, x10
100b4c598:     	ccmp	x9, x11, #0x0, eq
100b4c59c:     	ccmp	x12, x14, #0x0, eq
100b4c5a0:     	ccmp	x13, x15, #0x0, eq
100b4c5a4:     	ccmp	x16, x0, #0x0, eq
100b4c5a8:     	ccmp	x17, x1, #0x0, eq
100b4c5ac:     	ccmp	x2, x4, #0x0, eq
100b4c5b0:     	ccmp	x3, x5, #0x0, eq
100b4c5b4:     	b.ne	0x100b4c6e4 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x87c>
100b4c5b8:     	ldr	q0, [x20]
100b4c5bc:     	str	q0, [sp, #0x30]
100b4c5c0:     	add	x0, sp, #0x30
100b4c5c4:     	ldr	w1, [sp, #0x20]
100b4c5c8:     	ldr	w2, [sp, #0x18]
100b4c5cc:     	bl	0x1007fd304 <__Z18BLI_rcti_translateP4rctiii>
100b4c5d0:     	adrp	x8, 0x106368000 <_zlibVersion+0x106368000>
100b4c5d4:     	ldr	x8, [x8, #0x758]
100b4c5d8:     	ldr	x8, [x8]
100b4c5dc:     	cmn	x8, #0x1
100b4c5e0:     	b.eq	0x100b4c618 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x7b0>
100b4c5e4:     	add	x9, x8, #0x1
100b4c5e8:     	adrp	x10, 0x106368000 <_zlibVersion+0x106368000>
100b4c5ec:     	ldr	x10, [x10, #0x758]
100b4c5f0:     	str	x9, [x10]
100b4c5f4:     	b	0x100b4c61c <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x7b4>
100b4c5f8:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4c5fc:     	ldr	x8, [x24, #0x128]
100b4c600:     	ldr	x8, [x8, #0x298]
100b4c604:     	ldr	x0, [x8]
100b4c608:     	mov	w1, #0x0                ; =0
100b4c60c:     	bl	0x1008f4480 <__Z20GPU_offscreen_unbindP12GPUOffScreenb>
100b4c610:     	cbnz	w23, 0x100b4c400 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x598>
100b4c614:     	b	0x100b4c414 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x5ac>
100b4c618:     	mov	x8, #0x0                ; =0
100b4c61c:     	str	x8, [x23, #0x18]
100b4c620:     	mov	x0, x22
100b4c624:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b4c628:     	ldr	w8, [x0, #0x144]
100b4c62c:     	str	x8, [x23, #0x20]
100b4c630:     	ldrsw	x8, [x22, #0xc0]
100b4c634:     	str	x8, [x23, #0x28]
100b4c638:     	ldr	w8, [x24, #0xa8]
100b4c63c:     	str	w8, [x23, #0x30]
100b4c640:     	ldr	w8, [x24, #0xb0]
100b4c644:     	str	w8, [x23, #0x34]
100b4c648:     	ldr	w8, [x24, #0xac]
100b4c64c:     	str	w8, [x23, #0x38]
100b4c650:     	ldr	w8, [x24, #0xb4]
100b4c654:     	str	w8, [x23, #0x3c]
100b4c658:     	add	x8, x23, #0x40
100b4c65c:     	ldr	q0, [sp, #0x30]
100b4c660:     	ext.16b	v1, v0, v0, #0x8
100b4c664:     	st2.2s	{ v0, v1 }, [x8]
100b4c668:     	ldr	x8, [x24, #0x128]
100b4c66c:     	ldrb	w8, [x8, #0x1]
100b4c670:     	strb	w8, [x23, #0x138]
100b4c674:     	ldr	x8, [x24, #0x128]
100b4c678:     	ldrb	w8, [x8, #0x2]
100b4c67c:     	strb	w8, [x23, #0x139]
100b4c680:     	ldr	w8, [x21, #0x140]
100b4c684:     	str	w8, [x23, #0x50]
100b4c688:     	ldr	w8, [x21, #0x148]
100b4c68c:     	str	w8, [x23, #0x54]
100b4c690:     	ldr	w8, [x21, #0x144]
100b4c694:     	str	w8, [x23, #0x58]
100b4c698:     	ldr	w8, [x21, #0x14c]
100b4c69c:     	str	w8, [x23, #0x5c]
100b4c6a0:     	ldp	q0, q1, [sp, #0x40]
100b4c6a4:     	stp	q0, q1, [x23, #0x60]
100b4c6a8:     	ldp	q0, q1, [sp, #0x60]
100b4c6ac:     	stp	q0, q1, [x23, #0x80]
100b4c6b0:     	ldp	q0, q1, [sp, #0x80]
100b4c6b4:     	stp	q0, q1, [x23, #0xa0]
100b4c6b8:     	ldp	q0, q1, [sp, #0xa0]
100b4c6bc:     	stp	q0, q1, [x23, #0xc0]
100b4c6c0:     	ldr	q0, [sp, #0xc0]
100b4c6c4:     	str	q0, [x23, #0xe0]
100b4c6c8:     	ldr	x8, [sp, #0xd0]
100b4c6cc:     	str	x8, [x23, #0xf0]
100b4c6d0:     	add	x0, x23, #0xf8
100b4c6d4:     	add	x8, sp, #0x40
100b4c6d8:     	add	x1, x8, #0x98
100b4c6dc:     	mov	w2, #0x40               ; =64
100b4c6e0:     	bl	0x100819fcc <__Z11BLI_strncpyPcPKcm>
100b4c6e4:     	ldrb	w20, [sp, #0x1f8]
100b4c6e8:     	bl	0x1008f30ac <__Z19GPU_debug_group_endv>
100b4c6ec:     	ldr	x8, [x24, #0x128]
100b4c6f0:     	strh	wzr, [x8, #0x2b2]
100b4c6f4:     	tbz	w26, #0x1, 0x100b4c07c <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x214>
100b4c6f8:     	tbz	w20, #0x0, 0x100b4c07c <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x214>
100b4c6fc:     	mov	x0, x24
100b4c700:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
100b4c704:     	b	0x100b4c07c <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab+0x214>
100b4c708:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
