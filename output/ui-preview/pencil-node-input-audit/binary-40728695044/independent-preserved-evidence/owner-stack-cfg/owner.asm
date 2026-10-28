
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163cffc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE>:
10163cffc:     	stp	x28, x27, [sp, #-0x60]!
10163d000:     	stp	x26, x25, [sp, #0x10]
10163d004:     	stp	x24, x23, [sp, #0x20]
10163d008:     	stp	x22, x21, [sp, #0x30]
10163d00c:     	stp	x20, x19, [sp, #0x40]
10163d010:     	stp	x29, x30, [sp, #0x50]
10163d014:     	add	x29, sp, #0x50
10163d018:     	sub	sp, sp, #0x1a0
10163d01c:     	mov	x20, x4
10163d020:     	mov	x22, x3
10163d024:     	mov	x24, x2
10163d028:     	mov	x21, x1
10163d02c:     	mov	x19, x0
10163d030:     	add	x8, sp, #0xd0
10163d034:     	movi.16b	v0, #0x0
10163d038:     	stur	q0, [x8, #0x84]
10163d03c:     	stur	q0, [x8, #0x74]
10163d040:     	stur	q0, [x8, #0x94]
10163d044:     	stur	q0, [x8, #0xa4]
10163d048:     	stur	xzr, [x8, #0xb4]
10163d04c:     	stur	q0, [x8, #0x44]
10163d050:     	stur	q0, [x8, #0x34]
10163d054:     	stur	q0, [x8, #0x54]
10163d058:     	stur	q0, [x8, #0x64]
10163d05c:     	stur	q0, [x8, #0x4]
10163d060:     	stur	q0, [x8, #0x14]
10163d064:     	stur	q0, [x8, #0x24]
10163d068:     	ldp	q1, q2, [sp, #0x150]
10163d06c:     	stur	q1, [x4, #0x84]
10163d070:     	stur	q2, [x4, #0x94]
10163d074:     	ldr	q1, [sp, #0x170]
10163d078:     	stur	q1, [x4, #0xa4]
10163d07c:     	ldur	q1, [x8, #0xac]
10163d080:     	str	q1, [x4, #0xb0]
10163d084:     	ldp	q1, q2, [sp, #0x110]
10163d088:     	stur	q1, [x4, #0x44]
10163d08c:     	stur	q2, [x4, #0x54]
10163d090:     	ldp	q1, q2, [sp, #0x130]
10163d094:     	stur	q1, [x4, #0x64]
10163d098:     	stur	q2, [x4, #0x74]
10163d09c:     	ldp	q1, q2, [sp, #0xd0]
10163d0a0:     	stur	q1, [x4, #0x4]
10163d0a4:     	stur	q2, [x4, #0x14]
10163d0a8:     	ldp	q1, q2, [sp, #0xf0]
10163d0ac:     	stur	q1, [x4, #0x24]
10163d0b0:     	str	wzr, [x4]
10163d0b4:     	stur	q2, [x4, #0x34]
10163d0b8:     	mov	x23, x4
10163d0bc:     	str	q0, [x23, #0xc0]!
10163d0c0:     	stp	q0, q0, [x23, #0xf0]
10163d0c4:     	stp	q0, q0, [x23, #0xd0]
10163d0c8:     	stp	q0, q0, [x23, #0xb0]
10163d0cc:     	stp	q0, q0, [x23, #0x90]
10163d0d0:     	stp	q0, q0, [x23, #0x70]
10163d0d4:     	stp	q0, q0, [x23, #0x50]
10163d0d8:     	stp	q0, q0, [x23, #0x30]
10163d0dc:     	stp	q0, q0, [x23, #0x10]
10163d0e0:     	add	x8, x23, #0x10d
10163d0e4:     	str	xzr, [x8]
10163d0e8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163d0ec:     	mov	x8, x0
10163d0f0:     	mov	w0, #0x0                ; =0
10163d0f4:     	cbz	x21, 0x10163d138 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163d0f8:     	cbz	x8, 0x10163d138 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163d0fc:     	add	x0, x8, #0x1a0
10163d100:     	mov	x1, x21
10163d104:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163d108:     	cmn	w0, #0x1
10163d10c:     	b.eq	0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d110:     	mov	x0, x21
10163d114:     	bl	0x104a61074 <__Z27WM_window_get_active_screenPK8wmWindow>
10163d118:     	cbz	x0, 0x10163d138 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163d11c:     	adrp	x8, 0x106d8c000 <_build_commit_date>
10163d120:     	add	x8, x8, #0x28
10163d124:     	ldrb	w8, [x8, #0xc21]
10163d128:     	tbnz	w8, #0x0, 0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d12c:     	ldrb	w8, [x0, #0x1ee]
10163d130:     	cbz	w8, 0x10163d158 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x15c>
10163d134:     	mov	w0, #0x0                ; =0
10163d138:     	add	sp, sp, #0x1a0
10163d13c:     	ldp	x29, x30, [sp, #0x50]
10163d140:     	ldp	x20, x19, [sp, #0x40]
10163d144:     	ldp	x22, x21, [sp, #0x30]
10163d148:     	ldp	x24, x23, [sp, #0x20]
10163d14c:     	ldp	x26, x25, [sp, #0x10]
10163d150:     	ldp	x28, x27, [sp], #0x60
10163d154:     	ret
10163d158:     	mov	x8, x0
10163d15c:     	mov	w0, #0x0                ; =0
10163d160:     	cbz	x24, 0x10163d138 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163d164:     	ldrb	w9, [x8, #0x1ef]
10163d168:     	cbnz	w9, 0x10163d138 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163d16c:     	mov	x28, x8
10163d170:     	add	x0, x8, #0x1c0
10163d174:     	mov	x1, x24
10163d178:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163d17c:     	mov	x8, x0
10163d180:     	mov	w0, #0x0                ; =0
10163d184:     	cbz	x22, 0x10163d138 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163d188:     	cmn	w8, #0x1
10163d18c:     	b.eq	0x10163d138 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163d190:     	add	x0, x24, #0x78
10163d194:     	mov	x1, x22
10163d198:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163d19c:     	cmn	w0, #0x1
10163d1a0:     	b.eq	0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d1a4:     	ldrh	w8, [x22, #0xc0]
10163d1a8:     	cmp	w8, #0x8
10163d1ac:     	b.ne	0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d1b0:     	ldr	x8, [x22, #0x128]
10163d1b4:     	ldr	x9, [x8, #0x168]
10163d1b8:     	cbz	x9, 0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d1bc:     	ldrb	w9, [x24, #0x48]
10163d1c0:     	cmp	w9, #0x1
10163d1c4:     	b.ne	0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d1c8:     	ldr	w9, [x24, #0xd8]
10163d1cc:     	cmp	w9, #0x4
10163d1d0:     	b.eq	0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d1d4:     	ldrh	w8, [x8, #0x368]
10163d1d8:     	cbz	w8, 0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d1dc:     	ldrh	w8, [x22, #0xc4]
10163d1e0:     	mov	w9, #0x403              ; =1027
10163d1e4:     	tst	w8, w9
10163d1e8:     	b.ne	0x10163d134 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x138>
10163d1ec:     	str	xzr, [sp, #0x180]
10163d1f0:     	movi.16b	v0, #0x0
10163d1f4:     	stp	q0, q0, [sp, #0x160]
10163d1f8:     	stp	q0, q0, [sp, #0x140]
10163d1fc:     	stp	q0, q0, [sp, #0x120]
10163d200:     	stp	q0, q0, [sp, #0x100]
10163d204:     	stp	q0, q0, [sp, #0xe0]
10163d208:     	str	q0, [sp, #0xd0]
10163d20c:     	str	xzr, [sp, #0xc0]
10163d210:     	stp	q0, q0, [sp, #0xa0]
10163d214:     	stp	q0, q0, [sp, #0x80]
10163d218:     	stp	q0, q0, [sp, #0x60]
10163d21c:     	stp	q0, q0, [sp, #0x40]
10163d220:     	stp	q0, q0, [sp, #0x20]
10163d224:     	str	q0, [sp, #0x10]
10163d228:     	add	x3, sp, #0x10
10163d22c:     	mov	x0, x19
10163d230:     	mov	x1, x21
10163d234:     	mov	x2, x24
10163d238:     	bl	0x100b50b38 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
10163d23c:     	cbz	w0, 0x10163d264 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x268>
10163d240:     	mov	x25, x0
10163d244:     	add	x3, sp, #0xd0
10163d248:     	mov	x0, x19
10163d24c:     	mov	x1, x21
10163d250:     	mov	x2, x24
10163d254:     	bl	0x100b50434 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
10163d258:     	tbnz	w0, #0x0, 0x10163d278 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x27c>
10163d25c:     	mov	w25, #0x0               ; =0
10163d260:     	b	0x10163d314 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x318>
10163d264:     	ldrh	w8, [x22, #0xc4]
10163d268:     	ubfx	w8, w8, #7, #1
10163d26c:     	mov	x25, x0
10163d270:     	bic	w8, w8, w0
10163d274:     	tbnz	w8, #0x0, 0x10163d25c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x260>
10163d278:     	mov	x0, x19
10163d27c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
10163d280:     	str	x0, [sp, #0x8]
10163d284:     	mov	x0, x19
10163d288:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
10163d28c:     	mov	x26, x0
10163d290:     	mov	x0, x19
10163d294:     	mov	x1, x24
10163d298:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10163d29c:     	mov	x0, x19
10163d2a0:     	cbz	w25, 0x10163d2c8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2cc>
10163d2a4:     	mov	x1, x22
10163d2a8:     	bl	0x101f9045c <__Z32UI_ipad_knife_hud_geometry_readyPK8bContextPK7ARegion>
10163d2ac:     	cbz	w0, 0x10163d2f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163d2b0:     	add	x2, sp, #0xd0
10163d2b4:     	mov	x0, x19
10163d2b8:     	mov	x1, x21
10163d2bc:     	mov	w3, #0x0                ; =0
10163d2c0:     	bl	0x100b50d74 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb>
10163d2c4:     	b	0x10163d2d4 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2d8>
10163d2c8:     	mov	x1, x24
10163d2cc:     	mov	x2, x22
10163d2d0:     	bl	0x101f91434 <__Z25UI_ipad_corner_hud_windowP8bContextP7ScrAreaP7ARegion>
10163d2d4:     	mov	x27, x0
10163d2d8:     	cbz	x0, 0x10163d2f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163d2dc:     	add	x0, x24, #0x78
10163d2e0:     	mov	x1, x27
10163d2e4:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163d2e8:     	cmn	w0, #0x1
10163d2ec:     	b.eq	0x10163d2f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163d2f0:     	ldrh	w8, [x27, #0xc0]
10163d2f4:     	cbz	w8, 0x10163d31c <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x320>
10163d2f8:     	mov	w25, #0x0               ; =0
10163d2fc:     	mov	x0, x19
10163d300:     	ldr	x1, [sp, #0x8]
10163d304:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
10163d308:     	mov	x0, x19
10163d30c:     	mov	x1, x26
10163d310:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10163d314:     	mov	x0, x25
10163d318:     	b	0x10163d138 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x13c>
10163d31c:     	ldr	x8, [x27, #0x128]
10163d320:     	ldrh	w8, [x8, #0x368]
10163d324:     	cbz	w8, 0x10163d2f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163d328:     	mov	x0, x19
10163d32c:     	mov	x1, x27
10163d330:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
10163d334:     	cbz	w25, 0x10163d420 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x424>
10163d338:     	ldp	q0, q1, [sp, #0x150]
10163d33c:     	stur	q0, [x20, #0x88]
10163d340:     	stur	q1, [x20, #0x98]
10163d344:     	ldr	q0, [sp, #0x170]
10163d348:     	stur	q0, [x20, #0xa8]
10163d34c:     	ldp	q0, q1, [sp, #0x110]
10163d350:     	stur	q0, [x20, #0x48]
10163d354:     	stur	q1, [x20, #0x58]
10163d358:     	ldp	q0, q1, [sp, #0x130]
10163d35c:     	stur	q0, [x20, #0x68]
10163d360:     	stur	q1, [x20, #0x78]
10163d364:     	ldp	q0, q1, [sp, #0xd0]
10163d368:     	stur	q0, [x20, #0x8]
10163d36c:     	stur	q1, [x20, #0x18]
10163d370:     	ldp	q0, q1, [sp, #0xf0]
10163d374:     	stur	q0, [x20, #0x28]
10163d378:     	mov	w8, #0x1                ; =1
10163d37c:     	str	w8, [x20]
10163d380:     	ldr	x9, [sp, #0x180]
10163d384:     	stur	q1, [x20, #0x38]
10163d388:     	adrp	x8, 0x106d8c000 <_build_commit_date>
10163d38c:     	add	x8, x8, #0x28
10163d390:     	ldr	x8, [x8]
10163d394:     	stp	x9, x8, [x20, #0xb8]
10163d398:     	stp	x21, x28, [x20, #0xc8]
10163d39c:     	str	x24, [x20, #0xd8]
10163d3a0:     	ldr	w8, [x28, #0x144]
10163d3a4:     	str	x8, [x20, #0xe8]
10163d3a8:     	ldrsw	x8, [x21, #0xc0]
10163d3ac:     	str	x8, [x20, #0x118]
10163d3b0:     	mov	x0, x19
10163d3b4:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163d3b8:     	ldr	w8, [x0, #0x144]
10163d3bc:     	str	x8, [x20, #0x120]
10163d3c0:     	add	x8, x23, #0x104
10163d3c4:     	str	x22, [x20, #0x168]
10163d3c8:     	ldr	x9, [x22, #0x128]
10163d3cc:     	ldr	x9, [x9, #0x168]
10163d3d0:     	str	x9, [x20, #0x170]
10163d3d4:     	ldr	x9, [x22, #0x128]
10163d3d8:     	ldr	x9, [x9, #0x350]
10163d3dc:     	str	x9, [x20, #0x178]
10163d3e0:     	ldur	q0, [x22, #0xa8]
10163d3e4:     	str	q0, [x8]
10163d3e8:     	mov	x0, x21
10163d3ec:     	bl	0x100b982c8 <__Z24WM_window_native_pixel_xPK8wmWindow>
10163d3f0:     	str	w0, [x20, #0x1b8]
10163d3f4:     	mov	x0, x21
10163d3f8:     	bl	0x100b98300 <__Z24WM_window_native_pixel_yPK8wmWindow>
10163d3fc:     	str	w0, [x20, #0x1bc]
10163d400:     	adrp	x8, 0x106d8c000 <_build_commit_date>
10163d404:     	add	x8, x8, #0xe08
10163d408:     	ldr	s0, [x8, #0x2654]
10163d40c:     	str	s0, [x20, #0x1c0]
10163d410:     	mov	w8, #0x1                ; =1
10163d414:     	mov	w25, #0x1               ; =1
10163d418:     	strb	w8, [x20, #0x1d4]
10163d41c:     	b	0x10163d2fc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163d420:     	mov	x0, x19
10163d424:     	mov	x1, x23
10163d428:     	bl	0x101f928bc <__Z23UI_ipad_context_captureP8bContextPy>
10163d42c:     	cbz	w0, 0x10163d2fc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163d430:     	ldr	x8, [x20, #0xc8]
10163d434:     	cmp	x8, x21
10163d438:     	b.ne	0x10163d2fc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163d43c:     	mov	x0, x19
10163d440:     	bl	0x100b90d58 <__Z30WM_toolsystem_ref_from_contextPK8bContext>
10163d444:     	add	x8, x0, #0x10
10163d448:     	adrp	x9, 0x104b98000 <_zlibVersion+0x104b98000>
10163d44c:     	add	x9, x9, #0x94
10163d450:     	cmp	x0, #0x0
10163d454:     	csel	x1, x9, x8, eq
10163d458:     	add	x0, x23, #0x68
10163d45c:     	mov	w2, #0x40               ; =64
10163d460:     	bl	0x10081a008 <__Z11BLI_strncpyPcPKcm>
10163d464:     	mov	x0, x19
10163d468:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163d46c:     	mov	x27, x0
10163d470:     	ldr	x8, [x0, #0x5c0]
10163d474:     	cbz	x8, 0x10163d494 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x498>
10163d478:     	ldr	x8, [x8, #0xe0]
10163d47c:     	cbz	x8, 0x10163d494 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x498>
10163d480:     	str	x8, [x20, #0x1a0]
10163d484:     	ldr	x9, [x8]
10163d488:     	str	x9, [x20, #0x1a8]
10163d48c:     	ldr	x8, [x8, #0x8]
10163d490:     	str	x8, [x20, #0x1b0]
10163d494:     	mov	x0, x19
10163d498:     	bl	0x100b838d4 <__Z21WM_operator_last_redoPK8bContext>
10163d49c:     	cbz	x0, 0x10163d3c0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x3c4>
10163d4a0:     	mov	x24, x0
10163d4a4:     	ldr	x8, [x27, #0x5c0]
10163d4a8:     	add	x0, x8, #0x68
10163d4ac:     	mov	x1, x24
10163d4b0:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
10163d4b4:     	cmn	w0, #0x1
10163d4b8:     	b.eq	0x10163d2f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163d4bc:     	bl	0x100b7d104 <__Z31WM_operatortypes_registered_getv>
10163d4c0:     	cbz	x1, 0x10163d2f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163d4c4:     	ldr	x8, [x24, #0x58]
10163d4c8:     	lsl	x9, x1, #3
10163d4cc:     	ldr	x25, [x0]
10163d4d0:     	cmp	x25, x8
10163d4d4:     	b.eq	0x10163d4ec <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x4f0>
10163d4d8:     	mov	w25, #0x0               ; =0
10163d4dc:     	add	x0, x0, #0x8
10163d4e0:     	subs	x9, x9, #0x8
10163d4e4:     	b.ne	0x10163d4cc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x4d0>
10163d4e8:     	b	0x10163d2fc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163d4ec:     	cbz	x25, 0x10163d2fc <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x300>
10163d4f0:     	ldr	x8, [x25, #0xe8]
10163d4f4:     	cbz	x8, 0x10163d2f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
10163d4f8:     	str	x24, [x20, #0x180]
10163d4fc:     	mov	x0, x24
10163d500:     	bl	0x100b42e14 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
10163d504:     	stp	x0, x25, [x20, #0x188]
10163d508:     	ldr	x8, [x25, #0xe8]
10163d50c:     	str	x8, [x20, #0x198]
10163d510:     	cbnz	x0, 0x10163d3c0 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x3c4>
10163d514:     	b	0x10163d2f8 <__ZN12_GLOBAL__N_122ipad_hud_owner_captureEP8bContextP8wmWindowP7ScrAreaP7ARegionRNS_12IPadHUDOwnerE+0x2fc>
