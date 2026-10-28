
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f9102c <__ZL17hud_region_layoutPK8bContextP7ARegion>:
101f9102c:     	stp	x24, x23, [sp, #-0x40]!
101f91030:     	stp	x22, x21, [sp, #0x10]
101f91034:     	stp	x20, x19, [sp, #0x20]
101f91038:     	stp	x29, x30, [sp, #0x30]
101f9103c:     	add	x29, sp, #0x30
101f91040:     	mov	x19, x1
101f91044:     	mov	x20, x0
101f91048:     	ldr	x21, [x1, #0x120]
101f9104c:     	bl	0x101f9037c <__ZL21ipad_knife_hud_originPK8bContext>
101f91050:     	cbnz	x0, 0x101f91060 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x34>
101f91054:     	mov	x0, x20
101f91058:     	bl	0x101f912c8 <__Z21UI_ipad_corner_canvasP8bContext>
101f9105c:     	cbz	x0, 0x101f9117c <__ZL17hud_region_layoutPK8bContextP7ARegion+0x150>
101f91060:     	mov	x0, x20
101f91064:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f91068:     	mov	x21, x0
101f9106c:     	ldrh	w23, [x19, #0xc8]
101f91070:     	mov	x0, x20
101f91074:     	mov	x1, x19
101f91078:     	bl	0x101625ccc <__Z23ED_region_panels_layoutPK8bContextP7ARegion>
101f9107c:     	ldr	x22, [x19, #0xd0]
101f91080:     	cbz	x22, 0x101f911a4 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x178>
101f91084:     	mov	w24, #0x0               ; =0
101f91088:     	mov	x0, x22
101f9108c:     	bl	0x101f71a88 <__Z18UI_panel_is_activePK5Panel>
101f91090:     	orr	w24, w24, w0
101f91094:     	ldr	x22, [x22]
101f91098:     	cbnz	x22, 0x101f91088 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x5c>
101f9109c:     	tbz	w24, #0x0, 0x101f911a4 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x178>
101f910a0:     	ldr	x8, [x19, #0xd0]
101f910a4:     	cbz	x8, 0x101f91164 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x138>
101f910a8:     	ldrh	w8, [x21, #0x52]
101f910ac:     	ldrh	w9, [x19, #0xc8]
101f910b0:     	tbnz	w8, #0x3, 0x101f910bc <__ZL17hud_region_layoutPK8bContextP7ARegion+0x90>
101f910b4:     	cmp	w9, w23
101f910b8:     	b.eq	0x101f91164 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x138>
101f910bc:     	adrp	x8, 0x106d8c000 <_build_commit_date>
101f910c0:     	add	x8, x8, #0xe08
101f910c4:     	ldr	s0, [x8, #0x2654]
101f910c8:     	ldr	h1, [x19, #0xc6]
101f910cc:     	sshll.4s	v1, v1, #0x0
101f910d0:     	scvtf	s1, s1
101f910d4:     	fmov	s2, #0.50000000
101f910d8:     	fadd	s1, s1, s2
101f910dc:     	fmul	s1, s0, s1
101f910e0:     	fcvtzs	w8, s1
101f910e4:     	sxth	w9, w9
101f910e8:     	scvtf	s1, w9
101f910ec:     	fadd	s1, s1, s2
101f910f0:     	fmul	s0, s0, s1
101f910f4:     	fcvtzs	w9, s0
101f910f8:     	ldrh	w10, [x19, #0xc4]
101f910fc:     	tbz	w10, #0x5, 0x101f9110c <__ZL17hud_region_layoutPK8bContextP7ARegion+0xe0>
101f91100:     	ldrsh	w11, [x19, #0xb8]
101f91104:     	cmp	w8, w11
101f91108:     	csel	w8, w8, w11, lt
101f9110c:     	tbz	w10, #0x6, 0x101f9111c <__ZL17hud_region_layoutPK8bContextP7ARegion+0xf0>
101f91110:     	ldrsh	w10, [x19, #0xba]
101f91114:     	cmp	w9, w10
101f91118:     	csel	w9, w9, w10, lt
101f9111c:     	strh	w8, [x19, #0xb8]
101f91120:     	strh	w9, [x19, #0xba]
101f91124:     	ldr	w10, [x19, #0xa8]
101f91128:     	sxth	w2, w8
101f9112c:     	add	w8, w2, w10
101f91130:     	sub	w8, w8, #0x1
101f91134:     	str	w8, [x19, #0xac]
101f91138:     	ldr	w8, [x19, #0xb0]
101f9113c:     	sxth	w3, w9
101f91140:     	add	w8, w3, w8
101f91144:     	sub	w8, w8, #0x1
101f91148:     	str	w8, [x19, #0xb4]
101f9114c:     	add	x0, x19, #0x10
101f91150:     	mov	w1, #0x1                ; =1
101f91154:     	bl	0x101fdfcac <__Z23UI_view2d_region_reinitP6View2Dsii>
101f91158:     	mov	x0, x20
101f9115c:     	mov	x1, x19
101f91160:     	bl	0x101625ccc <__Z23ED_region_panels_layoutPK8bContextP7ARegion>
101f91164:     	mov	x0, x20
101f91168:     	ldp	x29, x30, [sp, #0x30]
101f9116c:     	ldp	x20, x19, [sp, #0x20]
101f91170:     	ldp	x22, x21, [sp, #0x10]
101f91174:     	ldp	x24, x23, [sp], #0x40
101f91178:     	b	0x101fe0d0c <__Z22UI_view2d_view_restorePK8bContext>
101f9117c:     	cbz	x21, 0x101f9119c <__ZL17hud_region_layoutPK8bContextP7ARegion+0x170>
101f91180:     	ldrb	w8, [x21, #0x2]
101f91184:     	tbnz	w8, #0x0, 0x101f9119c <__ZL17hud_region_layoutPK8bContextP7ARegion+0x170>
101f91188:     	ldrsh	w1, [x21]
101f9118c:     	ldr	w2, [x21, #0x30]
101f91190:     	mov	x0, x20
101f91194:     	bl	0x101f91e08 <__ZL14last_redo_pollPK8bContextsi>
101f91198:     	tbnz	w0, #0x0, 0x101f91060 <__ZL17hud_region_layoutPK8bContextP7ARegion+0x34>
101f9119c:     	mov	x0, x19
101f911a0:     	bl	0x1016203a8 <__Z20ED_region_tag_redrawP7ARegion>
101f911a4:     	ldrh	w8, [x19, #0xc4]
101f911a8:     	orr	w8, w8, #0x1
101f911ac:     	strh	w8, [x19, #0xc4]
101f911b0:     	add	x0, x19, #0xa8
101f911b4:     	mov	w1, #0x0                ; =0
101f911b8:     	mov	w2, #0x0                ; =0
101f911bc:     	mov	w3, #0x0                ; =0
101f911c0:     	mov	w4, #0x0                ; =0
101f911c4:     	ldp	x29, x30, [sp, #0x30]
101f911c8:     	ldp	x20, x19, [sp, #0x20]
101f911cc:     	ldp	x22, x21, [sp, #0x10]
101f911d0:     	ldp	x24, x23, [sp], #0x40
101f911d4:     	b	0x1007fcfb4 <__Z13BLI_rcti_initP4rctiiiii>
