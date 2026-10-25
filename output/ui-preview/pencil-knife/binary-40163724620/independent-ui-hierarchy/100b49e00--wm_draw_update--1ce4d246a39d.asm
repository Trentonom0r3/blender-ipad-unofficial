
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b49e00 <__Z14wm_draw_updateP8bContext>:
100b49e00:     	sub	sp, sp, #0xa0
100b49e04:     	stp	x28, x27, [sp, #0x40]
100b49e08:     	stp	x26, x25, [sp, #0x50]
100b49e0c:     	stp	x24, x23, [sp, #0x60]
100b49e10:     	stp	x22, x21, [sp, #0x70]
100b49e14:     	stp	x20, x19, [sp, #0x80]
100b49e18:     	stp	x29, x30, [sp, #0x90]
100b49e1c:     	add	x29, sp, #0x90
100b49e20:     	mov	x19, x0
100b49e24:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
100b49e28:     	str	x0, [sp, #0x10]
100b49e2c:     	mov	x0, x19
100b49e30:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b49e34:     	mov	x20, x0
100b49e38:     	bl	0x1008f2068 <__Z21GPU_context_main_lockv>
100b49e3c:     	bl	0x1008f2094 <__Z16GPU_render_beginv>
100b49e40:     	mov	w0, #0x0                ; =0
100b49e44:     	bl	0x1008f2128 <__Z15GPU_render_stepb>
100b49e48:     	bl	0x100211858 <__Z34BKE_image_free_unused_gpu_texturesv>
100b49e4c:     	mov	x0, x20
100b49e50:     	bl	0x100b95020 <__Z24wm_window_clear_drawableP15wmWindowManager>
100b49e54:     	str	x20, [sp, #0x8]
100b49e58:     	ldr	x21, [x20, #0x1a0]
100b49e5c:     	cbz	x21, 0x100b4a744 <__Z14wm_draw_updateP8bContext+0x944>
100b49e60:     	mov	w27, #0x1               ; =1
100b49e64:     	mov	x0, x19
100b49e68:     	mov	x1, x21
100b49e6c:     	bl	0x1000b4964 <__Z17CTX_wm_window_setP8bContextP8wmWindow>
100b49e70:     	mov	x0, x19
100b49e74:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b49e78:     	mov	x0, x21
100b49e7c:     	bl	0x100b94c9c <__Z26WM_window_get_active_scenePK8wmWindow>
100b49e80:     	mov	x25, x0
100b49e84:     	mov	x0, x21
100b49e88:     	bl	0x100b96dc4 <__Z31WM_window_get_active_view_layerPK8wmWindow>
100b49e8c:     	mov	x2, x0
100b49e90:     	ldr	x0, [sp, #0x10]
100b49e94:     	mov	x1, x25
100b49e98:     	bl	0x1003d2210 <__Z26BKE_scene_ensure_depsgraphP4MainP5SceneP9ViewLayer>
100b49e9c:     	mov	x26, x0
100b49ea0:     	mov	x0, x21
100b49ea4:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b49ea8:     	mov	x24, x0
100b49eac:     	ldr	x8, [x0, #0x1d0]
100b49eb0:     	cbz	x8, 0x100b49efc <__Z14wm_draw_updateP8bContext+0xfc>
100b49eb4:     	mov	w23, #0x0               ; =0
100b49eb8:     	b	0x100b49ec4 <__Z14wm_draw_updateP8bContext+0xc4>
100b49ebc:     	ldr	x8, [x8]
100b49ec0:     	cbz	x8, 0x100b49f00 <__Z14wm_draw_updateP8bContext+0x100>
100b49ec4:     	ldr	x9, [x8, #0x128]
100b49ec8:     	ldrh	w10, [x9, #0x2b4]
100b49ecc:     	cbz	w10, 0x100b49ee0 <__Z14wm_draw_updateP8bContext+0xe0>
100b49ed0:     	strb	w27, [x24, #0x1f3]
100b49ed4:     	ldr	x9, [x8, #0x128]
100b49ed8:     	strh	wzr, [x9, #0x2b4]
100b49edc:     	ldr	x9, [x8, #0x128]
100b49ee0:     	ldrh	w10, [x9, #0x2b0]
100b49ee4:     	cbz	w10, 0x100b49ebc <__Z14wm_draw_updateP8bContext+0xbc>
100b49ee8:     	ldrh	w9, [x9, #0x2b2]
100b49eec:     	cmp	w9, #0x0
100b49ef0:     	cset	w9, ne
100b49ef4:     	orr	w23, w9, w23
100b49ef8:     	b	0x100b49ebc <__Z14wm_draw_updateP8bContext+0xbc>
100b49efc:     	mov	w23, #0x0               ; =0
100b49f00:     	str	x21, [sp, #0x18]
100b49f04:     	mov	x0, x21
100b49f08:     	mov	x1, x24
100b49f0c:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b49f10:     	cbz	x0, 0x100b4a0f0 <__Z14wm_draw_updateP8bContext+0x2f0>
100b49f14:     	mov	x27, x0
100b49f18:     	b	0x100b49f30 <__Z14wm_draw_updateP8bContext+0x130>
100b49f1c:     	mov	x0, x24
100b49f20:     	mov	x1, x27
100b49f24:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b49f28:     	mov	x27, x0
100b49f2c:     	cbz	x0, 0x100b4a0f0 <__Z14wm_draw_updateP8bContext+0x2f0>
100b49f30:     	mov	x0, x24
100b49f34:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b49f38:     	cbz	w0, 0x100b49f48 <__Z14wm_draw_updateP8bContext+0x148>
100b49f3c:     	mov	x0, x27
100b49f40:     	bl	0x10163634c <__Z27ED_ipad_panels_area_visiblePK7ScrArea>
100b49f44:     	cbz	w0, 0x100b49f1c <__Z14wm_draw_updateP8bContext+0x11c>
100b49f48:     	ldr	x28, [x27, #0x78]
100b49f4c:     	cbnz	x28, 0x100b49f5c <__Z14wm_draw_updateP8bContext+0x15c>
100b49f50:     	b	0x100b49f1c <__Z14wm_draw_updateP8bContext+0x11c>
100b49f54:     	ldr	x28, [x28]
100b49f58:     	cbz	x28, 0x100b49f1c <__Z14wm_draw_updateP8bContext+0x11c>
100b49f5c:     	ldr	x8, [x28, #0x128]
100b49f60:     	ldr	x0, [x8, #0x288]
100b49f64:     	cbz	x0, 0x100b49f74 <__Z14wm_draw_updateP8bContext+0x174>
100b49f68:     	bl	0x100b3f80c <__Z22WM_gizmomap_group_listP10wmGizmoMap>
100b49f6c:     	ldr	x22, [x0]
100b49f70:     	cbnz	x22, 0x100b49fb0 <__Z14wm_draw_updateP8bContext+0x1b0>
100b49f74:     	ldrb	w8, [x27, #0x48]
100b49f78:     	cmp	w8, #0x1
100b49f7c:     	b.ne	0x100b49f88 <__Z14wm_draw_updateP8bContext+0x188>
100b49f80:     	ldrh	w8, [x28, #0xc0]
100b49f84:     	cbz	w8, 0x100b4a04c <__Z14wm_draw_updateP8bContext+0x24c>
100b49f88:     	ldr	x8, [x28, #0x128]
100b49f8c:     	ldrh	w9, [x8, #0x2b0]
100b49f90:     	cbz	w9, 0x100b49f54 <__Z14wm_draw_updateP8bContext+0x154>
100b49f94:     	ldrh	w8, [x8, #0x2b2]
100b49f98:     	cmp	w8, #0x0
100b49f9c:     	cset	w8, ne
100b49fa0:     	orr	w23, w8, w23
100b49fa4:     	b	0x100b49f54 <__Z14wm_draw_updateP8bContext+0x154>
100b49fa8:     	ldr	x22, [x22]
100b49fac:     	cbz	x22, 0x100b49f74 <__Z14wm_draw_updateP8bContext+0x174>
100b49fb0:     	ldr	x8, [x22, #0x10]
100b49fb4:     	ldrb	w8, [x8, #0x101]
100b49fb8:     	tbz	w8, #0x2, 0x100b4a01c <__Z14wm_draw_updateP8bContext+0x21c>
100b49fbc:     	mov	x0, x19
100b49fc0:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b49fc4:     	mov	x20, x0
100b49fc8:     	mov	x0, x19
100b49fcc:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b49fd0:     	mov	x21, x0
100b49fd4:     	mov	x0, x19
100b49fd8:     	mov	x1, x27
100b49fdc:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b49fe0:     	mov	x0, x19
100b49fe4:     	mov	x1, x28
100b49fe8:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b49fec:     	ldr	x1, [x22, #0x10]
100b49ff0:     	mov	x0, x19
100b49ff4:     	bl	0x100b3e308 <__Z24WM_gizmo_group_type_pollPK8bContextPK16wmGizmoGroupType>
100b49ff8:     	cbz	w0, 0x100b4a004 <__Z14wm_draw_updateP8bContext+0x204>
100b49ffc:     	mov	x0, x28
100b4a000:     	bl	0x10161f3a8 <__Z36ED_region_tag_redraw_editor_overlaysP7ARegion>
100b4a004:     	mov	x0, x19
100b4a008:     	mov	x1, x20
100b4a00c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b4a010:     	mov	x0, x19
100b4a014:     	mov	x1, x21
100b4a018:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4a01c:     	ldr	x20, [x22, #0x18]
100b4a020:     	cbnz	x20, 0x100b4a030 <__Z14wm_draw_updateP8bContext+0x230>
100b4a024:     	b	0x100b49fa8 <__Z14wm_draw_updateP8bContext+0x1a8>
100b4a028:     	ldr	x20, [x20]
100b4a02c:     	cbz	x20, 0x100b49fa8 <__Z14wm_draw_updateP8bContext+0x1a8>
100b4a030:     	ldrb	w8, [x20, #0x358]
100b4a034:     	cmp	w8, #0x1
100b4a038:     	b.ne	0x100b4a028 <__Z14wm_draw_updateP8bContext+0x228>
100b4a03c:     	mov	x0, x28
100b4a040:     	bl	0x10161f3a8 <__Z36ED_region_tag_redraw_editor_overlaysP7ARegion>
100b4a044:     	strb	wzr, [x20, #0x358]
100b4a048:     	b	0x100b4a028 <__Z14wm_draw_updateP8bContext+0x228>
100b4a04c:     	ldr	x8, [x28, #0x120]
100b4a050:     	ldr	x0, [x8, #0x2a0]
100b4a054:     	cbz	x0, 0x100b4a064 <__Z14wm_draw_updateP8bContext+0x264>
100b4a058:     	bl	0x100aee5a0 <__Z18RE_view_engine_getPK10ViewRender>
100b4a05c:     	mov	x20, x0
100b4a060:     	b	0x100b4a068 <__Z14wm_draw_updateP8bContext+0x268>
100b4a064:     	mov	x20, #0x0               ; =0
100b4a068:     	ldr	x8, [x28, #0x128]
100b4a06c:     	ldr	x8, [x8, #0x298]
100b4a070:     	cbz	x8, 0x100b4a080 <__Z14wm_draw_updateP8bContext+0x280>
100b4a074:     	ldr	x0, [x8, #0x8]
100b4a078:     	cbnz	x20, 0x100b4a088 <__Z14wm_draw_updateP8bContext+0x288>
100b4a07c:     	b	0x100b4a090 <__Z14wm_draw_updateP8bContext+0x290>
100b4a080:     	mov	x0, #0x0                ; =0
100b4a084:     	cbz	x20, 0x100b4a090 <__Z14wm_draw_updateP8bContext+0x290>
100b4a088:     	ldrb	w8, [x20, #0x10]
100b4a08c:     	tbnz	w8, #0x2, 0x100b4a0a8 <__Z14wm_draw_updateP8bContext+0x2a8>
100b4a090:     	cbz	x0, 0x100b49f88 <__Z14wm_draw_updateP8bContext+0x188>
100b4a094:     	bl	0x100a66d1c <__Z22GPU_viewport_do_updateP11GPUViewport>
100b4a098:     	cbz	w0, 0x100b49f88 <__Z14wm_draw_updateP8bContext+0x188>
100b4a09c:     	mov	x0, x28
100b4a0a0:     	bl	0x10161f34c <__Z31ED_region_tag_redraw_no_rebuildP7ARegion>
100b4a0a4:     	b	0x100b49f88 <__Z14wm_draw_updateP8bContext+0x188>
100b4a0a8:     	ldr	x2, [x27, #0x68]
100b4a0ac:     	add	x4, sp, #0x24
100b4a0b0:     	mov	x0, x25
100b4a0b4:     	mov	x1, x26
100b4a0b8:     	mov	x3, x28
100b4a0bc:     	bl	0x1022420e4 <__Z28ED_view3d_calc_render_borderPK5SceneP9DepsgraphP6View3DP7ARegionP4rcti>
100b4a0c0:     	cbz	w0, 0x100b4a0d8 <__Z14wm_draw_updateP8bContext+0x2d8>
100b4a0c4:     	add	x1, sp, #0x24
100b4a0c8:     	mov	x0, x28
100b4a0cc:     	mov	w2, #0x0                ; =0
100b4a0d0:     	bl	0x10161f400 <__Z28ED_region_tag_redraw_partialP7ARegionPK4rctib>
100b4a0d4:     	b	0x100b4a0e0 <__Z14wm_draw_updateP8bContext+0x2e0>
100b4a0d8:     	mov	x0, x28
100b4a0dc:     	bl	0x10161f34c <__Z31ED_region_tag_redraw_no_rebuildP7ARegion>
100b4a0e0:     	ldr	w8, [x20, #0x10]
100b4a0e4:     	and	w8, w8, #0xfffffffb
100b4a0e8:     	str	w8, [x20, #0x10]
100b4a0ec:     	b	0x100b49f88 <__Z14wm_draw_updateP8bContext+0x188>
100b4a0f0:     	ldr	x21, [sp, #0x18]
100b4a0f4:     	mov	w22, #-0x1              ; =-1
100b4a0f8:     	mov	w27, #0x1               ; =1
100b4a0fc:     	adrp	x28, 0x104b8d000 <_zlibVersion+0x104b8d000>
100b4a100:     	add	x28, x28, #0xbdf
100b4a104:     	tbnz	w23, #0x0, 0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a108:     	ldrb	w8, [x24, #0x1f1]
100b4a10c:     	cbnz	w8, 0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a110:     	ldrb	w8, [x24, #0x1f0]
100b4a114:     	cbnz	w8, 0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a118:     	ldrb	w8, [x24, #0x1f2]
100b4a11c:     	cbnz	w8, 0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a120:     	ldrb	w8, [x24, #0x1f3]
100b4a124:     	cbnz	w8, 0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a128:     	ldrb	w8, [x24, #0x1f4]
100b4a12c:     	cbz	w8, 0x100b4a688 <__Z14wm_draw_updateP8bContext+0x888>
100b4a130:     	ldr	x20, [sp, #0x8]
100b4a134:     	mov	x0, x20
100b4a138:     	mov	x1, x21
100b4a13c:     	bl	0x100b95034 <__Z23wm_window_make_drawableP15wmWindowManagerP8wmWindow>
100b4a140:     	mov	x0, x19
100b4a144:     	mov	x1, x20
100b4a148:     	mov	x2, x21
100b4a14c:     	bl	0x10162f724 <__Z24ED_screen_ensure_updatedP8bContextP15wmWindowManagerP8wmWindow>
100b4a150:     	ldr	x0, [x21, #0x18]
100b4a154:     	bl	0x1008f2040 <__Z23GPU_context_begin_frameP10GPUContext>
100b4a158:     	mov	x0, x21
100b4a15c:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b4a160:     	mov	x24, x0
100b4a164:     	mov	x0, x21
100b4a168:     	mov	w1, #0x0                ; =0
100b4a16c:     	bl	0x100b8e7c8 <__Z19WM_stereo3d_enabledP8wmWindowb>
100b4a170:     	mov	x25, x0
100b4a174:     	mov	x0, x21
100b4a178:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b4a17c:     	mov	x26, x0
100b4a180:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b4a184:     	cbz	w0, 0x100b4a190 <__Z14wm_draw_updateP8bContext+0x390>
100b4a188:     	ldr	x20, [x26, #0x1c0]
100b4a18c:     	cbnz	x20, 0x100b4a208 <__Z14wm_draw_updateP8bContext+0x408>
100b4a190:     	mov	x0, x21
100b4a194:     	mov	x1, x26
100b4a198:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b4a19c:     	b	0x100b4a1ac <__Z14wm_draw_updateP8bContext+0x3ac>
100b4a1a0:     	mov	x0, x26
100b4a1a4:     	mov	x1, x20
100b4a1a8:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b4a1ac:     	mov	x20, x0
100b4a1b0:     	cbz	x0, 0x100b4a22c <__Z14wm_draw_updateP8bContext+0x42c>
100b4a1b4:     	mov	x0, x26
100b4a1b8:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b4a1bc:     	cbz	w0, 0x100b4a1d8 <__Z14wm_draw_updateP8bContext+0x3d8>
100b4a1c0:     	mov	x0, x20
100b4a1c4:     	bl	0x10163634c <__Z27ED_ipad_panels_area_visiblePK7ScrArea>
100b4a1c8:     	cbz	w0, 0x100b4a1a0 <__Z14wm_draw_updateP8bContext+0x3a0>
100b4a1cc:     	ldr	w8, [x20, #0xd8]
100b4a1d0:     	cmp	w8, #0x1
100b4a1d4:     	b.eq	0x100b4a1a0 <__Z14wm_draw_updateP8bContext+0x3a0>
100b4a1d8:     	ldrb	w8, [x20, #0x48]
100b4a1dc:     	and	w8, w8, #0xfe
100b4a1e0:     	cmp	w8, #0x16
100b4a1e4:     	b.eq	0x100b4a1a0 <__Z14wm_draw_updateP8bContext+0x3a0>
100b4a1e8:     	mov	x0, x19
100b4a1ec:     	mov	x1, x21
100b4a1f0:     	mov	x2, x20
100b4a1f4:     	mov	x3, x25
100b4a1f8:     	bl	0x100b4be68 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab>
100b4a1fc:     	b	0x100b4a1a0 <__Z14wm_draw_updateP8bContext+0x3a0>
100b4a200:     	ldr	x20, [x20]
100b4a204:     	cbz	x20, 0x100b4a190 <__Z14wm_draw_updateP8bContext+0x390>
100b4a208:     	ldr	w8, [x20, #0xd8]
100b4a20c:     	cmp	w8, #0x1
100b4a210:     	b.ne	0x100b4a200 <__Z14wm_draw_updateP8bContext+0x400>
100b4a214:     	mov	x0, x19
100b4a218:     	mov	x1, x21
100b4a21c:     	mov	x2, x20
100b4a220:     	mov	x3, x25
100b4a224:     	bl	0x100b4be68 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab>
100b4a228:     	b	0x100b4a200 <__Z14wm_draw_updateP8bContext+0x400>
100b4a22c:     	mov	x0, x21
100b4a230:     	mov	x1, x26
100b4a234:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b4a238:     	b	0x100b4a248 <__Z14wm_draw_updateP8bContext+0x448>
100b4a23c:     	mov	x0, x26
100b4a240:     	mov	x1, x20
100b4a244:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b4a248:     	mov	x20, x0
100b4a24c:     	cbz	x0, 0x100b4a29c <__Z14wm_draw_updateP8bContext+0x49c>
100b4a250:     	mov	x0, x26
100b4a254:     	bl	0x101633618 <__Z22ED_ipad_panels_enabledPK7bScreen>
100b4a258:     	cbz	w0, 0x100b4a274 <__Z14wm_draw_updateP8bContext+0x474>
100b4a25c:     	mov	x0, x20
100b4a260:     	bl	0x10163634c <__Z27ED_ipad_panels_area_visiblePK7ScrArea>
100b4a264:     	cbz	w0, 0x100b4a23c <__Z14wm_draw_updateP8bContext+0x43c>
100b4a268:     	ldr	w8, [x20, #0xd8]
100b4a26c:     	cmp	w8, #0x1
100b4a270:     	b.eq	0x100b4a23c <__Z14wm_draw_updateP8bContext+0x43c>
100b4a274:     	ldrb	w8, [x20, #0x48]
100b4a278:     	and	w8, w8, #0xfe
100b4a27c:     	cmp	w8, #0x16
100b4a280:     	b.ne	0x100b4a23c <__Z14wm_draw_updateP8bContext+0x43c>
100b4a284:     	mov	x0, x19
100b4a288:     	mov	x1, x21
100b4a28c:     	mov	x2, x20
100b4a290:     	mov	x3, x25
100b4a294:     	bl	0x100b4be68 <__ZL22wm_draw_area_offscreenP8bContextP8wmWindowP7ScrAreab>
100b4a298:     	b	0x100b4a23c <__Z14wm_draw_updateP8bContext+0x43c>
100b4a29c:     	ldr	x26, [x26, #0x1d0]
100b4a2a0:     	cbnz	x26, 0x100b4a3a4 <__Z14wm_draw_updateP8bContext+0x5a4>
100b4a2a4:     	tbz	w25, #0x0, 0x100b4a2b8 <__Z14wm_draw_updateP8bContext+0x4b8>
100b4a2a8:     	ldr	x8, [x21, #0x138]
100b4a2ac:     	ldrb	w8, [x8, #0x2]
100b4a2b0:     	cmp	w8, #0x2
100b4a2b4:     	b.hs	0x100b4a4cc <__Z14wm_draw_updateP8bContext+0x6cc>
100b4a2b8:     	mov	x0, x19
100b4a2bc:     	mov	x1, x21
100b4a2c0:     	mov	w2, #-0x1               ; =-1
100b4a2c4:     	bl	0x100b486ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi>
100b4a2c8:     	strb	wzr, [x24, #0x1f0]
100b4a2cc:     	ldr	x0, [x21, #0x18]
100b4a2d0:     	bl	0x1008f2054 <__Z21GPU_context_end_frameP10GPUContext>
100b4a2d4:     	mov	x0, x21
100b4a2d8:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b4a2dc:     	mov	x24, x0
100b4a2e0:     	mov	x0, x21
100b4a2e4:     	mov	x1, x24
100b4a2e8:     	bl	0x101624af8 <__Z26ED_screen_areas_iter_firstPK8wmWindowPK7bScreen>
100b4a2ec:     	cbz	x0, 0x100b4a4b0 <__Z14wm_draw_updateP8bContext+0x6b0>
100b4a2f0:     	mov	x25, x0
100b4a2f4:     	b	0x100b4a30c <__Z14wm_draw_updateP8bContext+0x50c>
100b4a2f8:     	mov	x0, x24
100b4a2fc:     	mov	x1, x25
100b4a300:     	bl	0x101624b1c <__Z25ED_screen_areas_iter_nextPK7bScreenPK7ScrArea>
100b4a304:     	mov	x25, x0
100b4a308:     	cbz	x0, 0x100b4a4b0 <__Z14wm_draw_updateP8bContext+0x6b0>
100b4a30c:     	ldr	x20, [x25, #0x78]
100b4a310:     	cbnz	x20, 0x100b4a320 <__Z14wm_draw_updateP8bContext+0x520>
100b4a314:     	b	0x100b4a2f8 <__Z14wm_draw_updateP8bContext+0x4f8>
100b4a318:     	ldr	x20, [x20]
100b4a31c:     	cbz	x20, 0x100b4a2f8 <__Z14wm_draw_updateP8bContext+0x4f8>
100b4a320:     	ldr	x8, [x20, #0x128]
100b4a324:     	ldr	x0, [x8, #0x288]
100b4a328:     	cbz	x0, 0x100b4a318 <__Z14wm_draw_updateP8bContext+0x518>
100b4a32c:     	bl	0x100b3f80c <__Z22WM_gizmomap_group_listP10wmGizmoMap>
100b4a330:     	ldr	x8, [x0]
100b4a334:     	cbnz	x8, 0x100b4a344 <__Z14wm_draw_updateP8bContext+0x544>
100b4a338:     	b	0x100b4a318 <__Z14wm_draw_updateP8bContext+0x518>
100b4a33c:     	ldr	x8, [x8]
100b4a340:     	cbz	x8, 0x100b4a318 <__Z14wm_draw_updateP8bContext+0x518>
100b4a344:     	ldr	x9, [x8, #0x18]
100b4a348:     	cbnz	x9, 0x100b4a358 <__Z14wm_draw_updateP8bContext+0x558>
100b4a34c:     	b	0x100b4a33c <__Z14wm_draw_updateP8bContext+0x53c>
100b4a350:     	ldr	x9, [x9]
100b4a354:     	cbz	x9, 0x100b4a33c <__Z14wm_draw_updateP8bContext+0x53c>
100b4a358:     	ldrb	w10, [x9, #0x358]
100b4a35c:     	cmp	w10, #0x1
100b4a360:     	b.ne	0x100b4a350 <__Z14wm_draw_updateP8bContext+0x550>
100b4a364:     	strb	wzr, [x9, #0x358]
100b4a368:     	b	0x100b4a350 <__Z14wm_draw_updateP8bContext+0x550>
100b4a36c:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4a370:     	ldr	x8, [x26, #0x128]
100b4a374:     	ldr	x8, [x8, #0x298]
100b4a378:     	ldr	x0, [x8]
100b4a37c:     	mov	w1, #0x0                ; =0
100b4a380:     	bl	0x1008f4480 <__Z20GPU_offscreen_unbindP12GPUOffScreenb>
100b4a384:     	bl	0x1008f30ac <__Z19GPU_debug_group_endv>
100b4a388:     	ldr	x8, [x26, #0x128]
100b4a38c:     	strh	wzr, [x8, #0x2b2]
100b4a390:     	mov	x0, x19
100b4a394:     	mov	x1, #0x0                ; =0
100b4a398:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b4a39c:     	ldr	x26, [x26]
100b4a3a0:     	cbz	x26, 0x100b4a2a4 <__Z14wm_draw_updateP8bContext+0x4a4>
100b4a3a4:     	ldr	x8, [x26, #0x128]
100b4a3a8:     	ldrh	w8, [x8, #0x2b0]
100b4a3ac:     	cbz	w8, 0x100b4a39c <__Z14wm_draw_updateP8bContext+0x59c>
100b4a3b0:     	mov	x0, x19
100b4a3b4:     	mov	x1, x26
100b4a3b8:     	bl	0x1000b4b90 <__Z23CTX_wm_region_popup_setP8bContextP7ARegion>
100b4a3bc:     	mov	x0, x28
100b4a3c0:     	bl	0x1008f2fe0 <__Z21GPU_debug_group_beginPKc>
100b4a3c4:     	ldr	x8, [x26, #0x128]
100b4a3c8:     	ldr	x8, [x8, #0xb8]
100b4a3cc:     	cbz	x8, 0x100b4a3f8 <__Z14wm_draw_updateP8bContext+0x5f8>
100b4a3d0:     	ldr	x8, [x8, #0x40]
100b4a3d4:     	cbz	x8, 0x100b4a3f8 <__Z14wm_draw_updateP8bContext+0x5f8>
100b4a3d8:     	add	x0, x26, #0xa8
100b4a3dc:     	bl	0x100b8f1b4 <__Z10wmViewportPK4rcti>
100b4a3e0:     	ldr	x8, [x26, #0x128]
100b4a3e4:     	ldr	x8, [x8, #0xb8]
100b4a3e8:     	ldr	x8, [x8, #0x40]
100b4a3ec:     	mov	x0, x19
100b4a3f0:     	mov	x1, x26
100b4a3f4:     	blr	x8
100b4a3f8:     	mov	x0, x21
100b4a3fc:     	bl	0x100b94c9c <__Z26WM_window_get_active_scenePK8wmWindow>
100b4a400:     	mov	x1, x26
100b4a404:     	mov	w2, #0x0                ; =0
100b4a408:     	mov	w3, #0x0                ; =0
100b4a40c:     	bl	0x100b4a994 <__ZL28wm_draw_region_buffer_createP5SceneP7ARegionbb>
100b4a410:     	ldr	x8, [x26, #0x128]
100b4a414:     	ldr	x8, [x8, #0x298]
100b4a418:     	cbz	x8, 0x100b4a468 <__Z14wm_draw_updateP8bContext+0x668>
100b4a41c:     	ldr	x0, [x8, #0x8]
100b4a420:     	cbz	x0, 0x100b4a434 <__Z14wm_draw_updateP8bContext+0x634>
100b4a424:     	add	x2, x26, #0xa8
100b4a428:     	mov	w1, #0x0                ; =0
100b4a42c:     	bl	0x100a66dc0 <__Z17GPU_viewport_bindP11GPUViewportiPK4rcti>
100b4a430:     	b	0x100b4a45c <__Z14wm_draw_updateP8bContext+0x65c>
100b4a434:     	ldr	x0, [x8]
100b4a438:     	mov	w1, #0x0                ; =0
100b4a43c:     	bl	0x1008f441c <__Z18GPU_offscreen_bindP12GPUOffScreenb>
100b4a440:     	mov	w0, #0x1                ; =1
100b4a444:     	bl	0x100a62250 <__Z16GPU_scissor_testb>
100b4a448:     	ldrsh	w2, [x26, #0xb8]
100b4a44c:     	ldrsh	w3, [x26, #0xba]
100b4a450:     	mov	w0, #0x0                ; =0
100b4a454:     	mov	w1, #0x0                ; =0
100b4a458:     	bl	0x100a62280 <__Z11GPU_scissoriiii>
100b4a45c:     	ldr	x8, [x26, #0x128]
100b4a460:     	ldr	x8, [x8, #0x298]
100b4a464:     	str	wzr, [x8, #0x14]
100b4a468:     	fmov	s0, wzr
100b4a46c:     	fmov	s1, wzr
100b4a470:     	fmov	s2, wzr
100b4a474:     	fmov	s3, wzr
100b4a478:     	bl	0x1008f3cac <__Z15GPU_clear_colorffff>
100b4a47c:     	mov	x0, x19
100b4a480:     	mov	x1, x26
100b4a484:     	bl	0x10161e688 <__Z17ED_region_do_drawP8bContextP7ARegion>
100b4a488:     	ldr	x8, [x26, #0x128]
100b4a48c:     	ldr	x8, [x8, #0x298]
100b4a490:     	cbz	x8, 0x100b4a384 <__Z14wm_draw_updateP8bContext+0x584>
100b4a494:     	str	w22, [x8, #0x14]
100b4a498:     	ldr	x8, [x26, #0x128]
100b4a49c:     	ldr	x8, [x8, #0x298]
100b4a4a0:     	ldr	x0, [x8, #0x8]
100b4a4a4:     	cbz	x0, 0x100b4a36c <__Z14wm_draw_updateP8bContext+0x56c>
100b4a4a8:     	bl	0x100a678c8 <__Z19GPU_viewport_unbindP11GPUViewport>
100b4a4ac:     	b	0x100b4a384 <__Z14wm_draw_updateP8bContext+0x584>
100b4a4b0:     	strh	wzr, [x24, #0x1f2]
100b4a4b4:     	strb	wzr, [x24, #0x1f4]
100b4a4b8:     	mov	x0, x21
100b4a4bc:     	bl	0x100b966a4 <__Z22wm_window_swap_buffersP8wmWindow>
100b4a4c0:     	ldr	x21, [x21]
100b4a4c4:     	cbnz	x21, 0x100b49e64 <__Z14wm_draw_updateP8bContext+0x64>
100b4a4c8:     	b	0x100b4a744 <__Z14wm_draw_updateP8bContext+0x944>
100b4a4cc:     	b.ne	0x100b4a4f4 <__Z14wm_draw_updateP8bContext+0x6f4>
100b4a4d0:     	mov	w0, #0x1                ; =1
100b4a4d4:     	bl	0x1008f38a8 <__Z19GPU_backbuffer_bind14eGPUBackBuffer>
100b4a4d8:     	mov	x0, x19
100b4a4dc:     	mov	x1, x21
100b4a4e0:     	mov	w2, #0x1                ; =1
100b4a4e4:     	bl	0x100b486ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi>
100b4a4e8:     	mov	w0, #0x0                ; =0
100b4a4ec:     	bl	0x1008f38a8 <__Z19GPU_backbuffer_bind14eGPUBackBuffer>
100b4a4f0:     	b	0x100b4a5f4 <__Z14wm_draw_updateP8bContext+0x7f4>
100b4a4f4:     	mov	x0, x21
100b4a4f8:     	bl	0x100b94c9c <__Z26WM_window_get_active_scenePK8wmWindow>
100b4a4fc:     	cbz	x0, 0x100b4a54c <__Z14wm_draw_updateP8bContext+0x74c>
100b4a500:     	mov	x20, x0
100b4a504:     	mov	w8, #0x1590             ; =5520
100b4a508:     	add	x0, x0, x8
100b4a50c:     	mov	w8, #0x1530             ; =5424
100b4a510:     	add	x1, x20, x8
100b4a514:     	bl	0x100aa9408 <__Z34IMB_colormanagement_display_is_hdrPK27ColorManagedDisplaySettingsPKc>
100b4a518:     	tbnz	w0, #0x0, 0x100b4a534 <__Z14wm_draw_updateP8bContext+0x734>
100b4a51c:     	mov	w8, #0x1590             ; =5520
100b4a520:     	add	x0, x20, x8
100b4a524:     	mov	w8, #0x1530             ; =5424
100b4a528:     	add	x1, x20, x8
100b4a52c:     	bl	0x100aa949c <__Z41IMB_colormanagement_display_is_wide_gamutPK27ColorManagedDisplaySettingsPKc>
100b4a530:     	cbz	w0, 0x100b4a54c <__Z14wm_draw_updateP8bContext+0x74c>
100b4a534:     	bl	0x1008ecc88 <__Z15GPU_hdr_supportv>
100b4a538:     	cmp	w0, #0x0
100b4a53c:     	mov	w8, #0xc                ; =12
100b4a540:     	mov	w9, #0x2c               ; =44
100b4a544:     	csel	w20, w9, w8, ne
100b4a548:     	b	0x100b4a550 <__Z14wm_draw_updateP8bContext+0x750>
100b4a54c:     	mov	w20, #0xc               ; =12
100b4a550:     	mov	x0, x21
100b4a554:     	bl	0x100b96ac4 <__Z27WM_window_native_pixel_sizePK8wmWindow>
100b4a558:     	lsr	x1, x0, #32
100b4a55c:     	mov	w2, #0x0                ; =0
100b4a560:     	mov	x3, x20
100b4a564:     	mov	w4, #0x1                ; =1
100b4a568:     	mov	w5, #0x0                ; =0
100b4a56c:     	mov	x6, #0x0                ; =0
100b4a570:     	bl	0x1008f3f60 <__Z20GPU_offscreen_createiibN7blender3gpu13TextureFormatE16eGPUTextureUsagebPc>
100b4a574:     	cbz	x0, 0x100b4a5f4 <__Z14wm_draw_updateP8bContext+0x7f4>
100b4a578:     	mov	x25, x0
100b4a57c:     	bl	0x1008f469c <__Z27GPU_offscreen_color_texturePK12GPUOffScreen>
100b4a580:     	mov	x26, x0
100b4a584:     	mov	x0, x25
100b4a588:     	bl	0x1008f469c <__Z27GPU_offscreen_color_texturePK12GPUOffScreen>
100b4a58c:     	mov	w1, #0x0                ; =0
100b4a590:     	mov	w2, #0x0                ; =0
100b4a594:     	bl	0x100a64554 <__Z23GPU_texture_mipmap_modePN7blender3gpu7TextureEbb>
100b4a598:     	mov	x0, x25
100b4a59c:     	mov	w1, #0x0                ; =0
100b4a5a0:     	bl	0x1008f441c <__Z18GPU_offscreen_bindP12GPUOffScreenb>
100b4a5a4:     	mov	x0, x19
100b4a5a8:     	mov	x1, x21
100b4a5ac:     	mov	w2, #0x0                ; =0
100b4a5b0:     	bl	0x100b486ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi>
100b4a5b4:     	mov	x0, x25
100b4a5b8:     	mov	w1, #0x0                ; =0
100b4a5bc:     	bl	0x1008f4480 <__Z20GPU_offscreen_unbindP12GPUOffScreenb>
100b4a5c0:     	mov	x0, x26
100b4a5c4:     	mov	w1, #0x0                ; =0
100b4a5c8:     	bl	0x100a643fc <__Z16GPU_texture_bindPN7blender3gpu7TextureEi>
100b4a5cc:     	mov	x0, x21
100b4a5d0:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b4a5d4:     	ldr	x8, [x21, #0x138]
100b4a5d8:     	ldrb	w8, [x8, #0x2]
100b4a5dc:     	mov	x0, x21
100b4a5e0:     	cmp	w8, #0x3
100b4a5e4:     	b.ne	0x100b4a604 <__Z14wm_draw_updateP8bContext+0x804>
100b4a5e8:     	mov	w1, #0x0                ; =0
100b4a5ec:     	bl	0x100b8e4d4 <__Z27wm_stereo3d_draw_sidebysideP8wmWindowi>
100b4a5f0:     	b	0x100b4a60c <__Z14wm_draw_updateP8bContext+0x80c>
100b4a5f4:     	mov	x0, x19
100b4a5f8:     	mov	x1, x21
100b4a5fc:     	mov	w2, #0x0                ; =0
100b4a600:     	b	0x100b4a2c4 <__Z14wm_draw_updateP8bContext+0x4c4>
100b4a604:     	mov	w1, #0x0                ; =0
100b4a608:     	bl	0x100b8e664 <__Z26wm_stereo3d_draw_topbottomP8wmWindowi>
100b4a60c:     	mov	x0, x26
100b4a610:     	bl	0x100a64438 <__Z18GPU_texture_unbindPN7blender3gpu7TextureE>
100b4a614:     	mov	x0, x25
100b4a618:     	mov	w1, #0x0                ; =0
100b4a61c:     	bl	0x1008f441c <__Z18GPU_offscreen_bindP12GPUOffScreenb>
100b4a620:     	mov	x0, x19
100b4a624:     	mov	x1, x21
100b4a628:     	mov	w2, #0x1                ; =1
100b4a62c:     	bl	0x100b486ec <__ZL23wm_draw_window_onscreenP8bContextP8wmWindowi>
100b4a630:     	mov	x0, x25
100b4a634:     	mov	w1, #0x0                ; =0
100b4a638:     	bl	0x1008f4480 <__Z20GPU_offscreen_unbindP12GPUOffScreenb>
100b4a63c:     	mov	x0, x26
100b4a640:     	mov	w1, #0x0                ; =0
100b4a644:     	bl	0x100a643fc <__Z16GPU_texture_bindPN7blender3gpu7TextureEi>
100b4a648:     	mov	x0, x21
100b4a64c:     	bl	0x100b8f440 <__Z16wmWindowViewportPK8wmWindow>
100b4a650:     	ldr	x8, [x21, #0x138]
100b4a654:     	ldrb	w8, [x8, #0x2]
100b4a658:     	mov	x0, x21
100b4a65c:     	mov	w1, #0x1                ; =1
100b4a660:     	cmp	w8, #0x3
100b4a664:     	b.ne	0x100b4a670 <__Z14wm_draw_updateP8bContext+0x870>
100b4a668:     	bl	0x100b8e4d4 <__Z27wm_stereo3d_draw_sidebysideP8wmWindowi>
100b4a66c:     	b	0x100b4a674 <__Z14wm_draw_updateP8bContext+0x874>
100b4a670:     	bl	0x100b8e664 <__Z26wm_stereo3d_draw_topbottomP8wmWindowi>
100b4a674:     	mov	x0, x26
100b4a678:     	bl	0x100a64438 <__Z18GPU_texture_unbindPN7blender3gpu7TextureE>
100b4a67c:     	mov	x0, x25
100b4a680:     	bl	0x1008f41c4 <__Z18GPU_offscreen_freeP12GPUOffScreen>
100b4a684:     	b	0x100b4a2c8 <__Z14wm_draw_updateP8bContext+0x4c8>
100b4a688:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b4a68c:     	ldrb	w8, [x8, #0x210]
100b4a690:     	cmp	w8, #0xff
100b4a694:     	b.eq	0x100b4a72c <__Z14wm_draw_updateP8bContext+0x92c>
100b4a698:     	cbz	w8, 0x100b4a4c0 <__Z14wm_draw_updateP8bContext+0x6c0>
100b4a69c:     	ldr	x0, [x21, #0x10]
100b4a6a0:     	bl	0x101094a90 <_GHOST_GetCursorVisibility>
100b4a6a4:     	cbz	w0, 0x100b4a714 <__Z14wm_draw_updateP8bContext+0x914>
100b4a6a8:     	ldr	x0, [x21, #0x10]
100b4a6ac:     	add	x1, sp, #0x24
100b4a6b0:     	add	x8, sp, #0x24
100b4a6b4:     	add	x2, x8, #0x4
100b4a6b8:     	add	x3, x8, #0x8
100b4a6bc:     	add	x4, sp, #0x3f
100b4a6c0:     	bl	0x101094b50 <_GHOST_GetCursorGrabState>
100b4a6c4:     	ldrb	w8, [sp, #0x3f]
100b4a6c8:     	cmp	w8, #0x1
100b4a6cc:     	b.ne	0x100b4a714 <__Z14wm_draw_updateP8bContext+0x914>
100b4a6d0:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b4a6d4:     	ldr	w8, [x8, #0x214]
100b4a6d8:     	ldr	w9, [x21, #0xc0]
100b4a6dc:     	cmp	w8, w9
100b4a6e0:     	b.ne	0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a6e4:     	adrp	x8, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b4a6e8:     	ldr	w9, [x8, #0x798]
100b4a6ec:     	ldr	x8, [x21, #0xf0]
100b4a6f0:     	ldr	w10, [x8, #0x14]
100b4a6f4:     	cmp	w9, w10
100b4a6f8:     	b.ne	0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a6fc:     	adrp	x9, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b4a700:     	ldr	w9, [x9, #0x79c]
100b4a704:     	ldr	w8, [x8, #0x18]
100b4a708:     	cmp	w9, w8
100b4a70c:     	b.ne	0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a710:     	b	0x100b4a4c0 <__Z14wm_draw_updateP8bContext+0x6c0>
100b4a714:     	adrp	x8, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b4a718:     	ldr	w8, [x8, #0x214]
100b4a71c:     	ldr	w9, [x21, #0xc0]
100b4a720:     	cmp	w8, w9
100b4a724:     	b.eq	0x100b4a130 <__Z14wm_draw_updateP8bContext+0x330>
100b4a728:     	b	0x100b4a4c0 <__Z14wm_draw_updateP8bContext+0x6c0>
100b4a72c:     	bl	0x100b94dc4 <__Z20WM_capabilities_flagv>
100b4a730:     	bic	w8, w27, w0
100b4a734:     	adrp	x9, 0x106658000 <__ZN7blender3seq28seqModifierType_WhiteBalanceE+0x40>
100b4a738:     	strb	w8, [x9, #0x210]
100b4a73c:     	cbnz	w8, 0x100b4a69c <__Z14wm_draw_updateP8bContext+0x89c>
100b4a740:     	b	0x100b4a4c0 <__Z14wm_draw_updateP8bContext+0x6c0>
100b4a744:     	mov	x0, x19
100b4a748:     	mov	x1, #0x0                ; =0
100b4a74c:     	bl	0x1000b4964 <__Z17CTX_wm_window_setP8bContextP8wmWindow>
100b4a750:     	adrp	x1, 0x100b4a000 <__Z14wm_draw_updateP8bContext+0x200>
100b4a754:     	add	x1, x1, #0x788
100b4a758:     	mov	x0, x19
100b4a75c:     	bl	0x100b8f5a8 <__Z16wm_surfaces_iterP8bContextPFvS0_P9wmSurfaceE>
100b4a760:     	bl	0x1008f20d4 <__Z14GPU_render_endv>
100b4a764:     	bl	0x1008f2074 <__Z23GPU_context_main_unlockv>
100b4a768:     	ldp	x29, x30, [sp, #0x90]
100b4a76c:     	ldp	x20, x19, [sp, #0x80]
100b4a770:     	ldp	x22, x21, [sp, #0x70]
100b4a774:     	ldp	x24, x23, [sp, #0x60]
100b4a778:     	ldp	x26, x25, [sp, #0x50]
100b4a77c:     	ldp	x28, x27, [sp, #0x40]
100b4a780:     	add	sp, sp, #0xa0
100b4a784:     	ret
