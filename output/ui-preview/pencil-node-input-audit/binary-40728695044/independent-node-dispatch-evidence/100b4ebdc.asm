
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b4ebdc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent>:
100b4ebdc:     	stp	x26, x25, [sp, #-0x50]!
100b4ebe0:     	stp	x24, x23, [sp, #0x10]
100b4ebe4:     	stp	x22, x21, [sp, #0x20]
100b4ebe8:     	stp	x20, x19, [sp, #0x30]
100b4ebec:     	stp	x29, x30, [sp, #0x40]
100b4ebf0:     	add	x29, sp, #0x40
100b4ebf4:     	mov	x24, x6
100b4ebf8:     	mov	x20, x5
100b4ebfc:     	mov	x25, x4
100b4ec00:     	mov	x21, x3
100b4ec04:     	mov	x22, x2
100b4ec08:     	mov	x23, x1
100b4ec0c:     	mov	x19, x0
100b4ec10:     	bl	0x1000b1210 <__Z30CTX_wm_operator_poll_msg_clearP8bContext>
100b4ec14:     	cbz	x23, 0x100b4ee5c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x280>
100b4ec18:     	and	w26, w25, #0xff
100b4ec1c:     	mov	x0, x19
100b4ec20:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b4ec24:     	cbz	x24, 0x100b4ec40 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x64>
100b4ec28:     	sub	w8, w26, #0x6
100b4ec2c:     	cmp	w8, #0x6
100b4ec30:     	csel	x24, xzr, x24, lo
100b4ec34:     	cmp	w26, #0x5
100b4ec38:     	b.gt	0x100b4ec58 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x7c>
100b4ec3c:     	b	0x100b4ec84 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0xa8>
100b4ec40:     	cmp	w26, #0x5
100b4ec44:     	b.hi	0x100b4ec78 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x9c>
100b4ec48:     	cbz	x0, 0x100b4ee48 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x26c>
100b4ec4c:     	ldr	x24, [x0, #0xf0]
100b4ec50:     	cmp	w26, #0x5
100b4ec54:     	b.le	0x100b4ec84 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0xa8>
100b4ec58:     	cmp	w26, #0x9
100b4ec5c:     	b.gt	0x100b4ed18 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x13c>
100b4ec60:     	sub	w8, w26, #0x7
100b4ec64:     	cmp	w8, #0x3
100b4ec68:     	b.lo	0x100b4ec98 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0xbc>
100b4ec6c:     	cmp	w26, #0x6
100b4ec70:     	b.eq	0x100b4ee10 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x234>
100b4ec74:     	b	0x100b4ee5c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x280>
100b4ec78:     	mov	x24, #0x0               ; =0
100b4ec7c:     	cmp	w26, #0x5
100b4ec80:     	b.gt	0x100b4ec58 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x7c>
100b4ec84:     	cmp	w26, #0x3
100b4ec88:     	b.gt	0x100b4ed2c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x150>
100b4ec8c:     	sub	w8, w26, #0x1
100b4ec90:     	cmp	w8, #0x3
100b4ec94:     	b.hs	0x100b4ee0c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x230>
100b4ec98:     	mov	x0, x19
100b4ec9c:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b4eca0:     	mov	x25, x0
100b4eca4:     	mov	x0, x19
100b4eca8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b4ecac:     	mov	w8, #0x0                ; =0
100b4ecb0:     	mov	w1, #0x2                ; =2
100b4ecb4:     	cmp	w26, #0x7
100b4ecb8:     	b.gt	0x100b4ecd8 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0xfc>
100b4ecbc:     	cmp	w26, #0x2
100b4ecc0:     	b.eq	0x100b4ecf0 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x114>
100b4ecc4:     	cmp	w26, #0x3
100b4ecc8:     	b.eq	0x100b4ece8 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x10c>
100b4eccc:     	mov	w1, #0x0                ; =0
100b4ecd0:     	mov	w8, #0x1                ; =1
100b4ecd4:     	b	0x100b4ecf0 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x114>
100b4ecd8:     	cmp	w26, #0x8
100b4ecdc:     	b.eq	0x100b4ecf0 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x114>
100b4ece0:     	cmp	w26, #0x9
100b4ece4:     	b.ne	0x100b4eccc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0xf0>
100b4ece8:     	mov	w8, #0x0                ; =0
100b4ecec:     	mov	w1, #0x7                ; =7
100b4ecf0:     	cbz	x25, 0x100b4ed00 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x124>
100b4ecf4:     	ldrsh	w9, [x25, #0xc0]
100b4ecf8:     	cmp	w1, w9
100b4ecfc:     	b.eq	0x100b4edd0 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1f4>
100b4ed00:     	cbz	x0, 0x100b4edd0 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1f4>
100b4ed04:     	cbz	w8, 0x100b4edbc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1e0>
100b4ed08:     	bl	0x1003d6710 <__Z31BKE_area_find_region_active_winPK7ScrArea>
100b4ed0c:     	mov	x1, x0
100b4ed10:     	cbnz	x0, 0x100b4edc8 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1ec>
100b4ed14:     	b	0x100b4edd0 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1f4>
100b4ed18:     	cmp	w26, #0xa
100b4ed1c:     	b.eq	0x100b4eda4 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1c8>
100b4ed20:     	cmp	w26, #0xb
100b4ed24:     	b.eq	0x100b4ed3c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x160>
100b4ed28:     	b	0x100b4ee5c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x280>
100b4ed2c:     	cmp	w26, #0x4
100b4ed30:     	b.eq	0x100b4eda4 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1c8>
100b4ed34:     	cmp	w26, #0x5
100b4ed38:     	b.ne	0x100b4ee5c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x280>
100b4ed3c:     	mov	x0, x19
100b4ed40:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b4ed44:     	mov	x25, x0
100b4ed48:     	mov	x0, x19
100b4ed4c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b4ed50:     	mov	x26, x0
100b4ed54:     	mov	x0, x19
100b4ed58:     	mov	x1, #0x0                ; =0
100b4ed5c:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4ed60:     	mov	x0, x19
100b4ed64:     	mov	x1, #0x0                ; =0
100b4ed68:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b4ed6c:     	mov	x0, x19
100b4ed70:     	mov	x1, x23
100b4ed74:     	mov	x2, x24
100b4ed78:     	mov	x3, x22
100b4ed7c:     	mov	x4, x21
100b4ed80:     	mov	x5, x20
100b4ed84:     	mov	w6, #0x1                ; =1
100b4ed88:     	mov	w7, #0x0                ; =0
100b4ed8c:     	bl	0x100b5d30c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch>
100b4ed90:     	mov	x20, x0
100b4ed94:     	mov	x0, x19
100b4ed98:     	mov	x1, x26
100b4ed9c:     	bl	0x1000b4aa8 <__Z15CTX_wm_area_setP8bContextP7ScrArea>
100b4eda0:     	b	0x100b4edf8 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x21c>
100b4eda4:     	mov	x0, x19
100b4eda8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b4edac:     	mov	x25, x0
100b4edb0:     	mov	x0, x19
100b4edb4:     	mov	x1, #0x0                ; =0
100b4edb8:     	b	0x100b4edcc <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1f0>
100b4edbc:     	bl	0x1003d66f0 <__Z25BKE_area_find_region_typePK7ScrAreai>
100b4edc0:     	mov	x1, x0
100b4edc4:     	cbz	x0, 0x100b4edd0 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x1f4>
100b4edc8:     	mov	x0, x19
100b4edcc:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4edd0:     	mov	x0, x19
100b4edd4:     	mov	x1, x23
100b4edd8:     	mov	x2, x24
100b4eddc:     	mov	x3, x22
100b4ede0:     	mov	x4, x21
100b4ede4:     	mov	x5, x20
100b4ede8:     	mov	w6, #0x1                ; =1
100b4edec:     	mov	w7, #0x0                ; =0
100b4edf0:     	bl	0x100b5d30c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch>
100b4edf4:     	mov	x20, x0
100b4edf8:     	mov	x0, x19
100b4edfc:     	mov	x1, x25
100b4ee00:     	bl	0x1000b4b1c <__Z17CTX_wm_region_setP8bContextP7ARegion>
100b4ee04:     	mov	x0, x20
100b4ee08:     	b	0x100b4ee60 <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x284>
100b4ee0c:     	cbnz	w26, 0x100b4ee5c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x280>
100b4ee10:     	mov	x0, x19
100b4ee14:     	mov	x1, x23
100b4ee18:     	mov	x2, x24
100b4ee1c:     	mov	x3, x22
100b4ee20:     	mov	x4, x21
100b4ee24:     	mov	x5, x20
100b4ee28:     	mov	w6, #0x1                ; =1
100b4ee2c:     	mov	w7, #0x0                ; =0
100b4ee30:     	ldp	x29, x30, [sp, #0x40]
100b4ee34:     	ldp	x20, x19, [sp, #0x30]
100b4ee38:     	ldp	x22, x21, [sp, #0x20]
100b4ee3c:     	ldp	x24, x23, [sp, #0x10]
100b4ee40:     	ldp	x26, x25, [sp], #0x50
100b4ee44:     	b	0x100b5d30c <__ZL18wm_operator_invokeP8bContextP14wmOperatorTypePK7wmEventP10PointerRNAP10ReportListbb23eIPadNodeView2DDispatch>
100b4ee48:     	cbz	w20, 0x100b4ee5c <__ZL25wm_operator_call_internalP8bContextP14wmOperatorTypeP10PointerRNAP10ReportListN7blender2wm13OpCallContextEbPK7wmEvent+0x280>
100b4ee4c:     	adrp	x1, 0x104bd4000 <__ZL3hex+0x45cd>
100b4ee50:     	add	x1, x1, #0xb38
100b4ee54:     	mov	x0, x19
100b4ee58:     	bl	0x1000b4ba0 <__Z28CTX_wm_operator_poll_msg_setP8bContextPKc>
100b4ee5c:     	mov	w0, #0x0                ; =0
100b4ee60:     	ldp	x29, x30, [sp, #0x40]
100b4ee64:     	ldp	x20, x19, [sp, #0x30]
100b4ee68:     	ldp	x22, x21, [sp, #0x20]
100b4ee6c:     	ldp	x24, x23, [sp, #0x10]
100b4ee70:     	ldp	x26, x25, [sp], #0x50
100b4ee74:     	ret
