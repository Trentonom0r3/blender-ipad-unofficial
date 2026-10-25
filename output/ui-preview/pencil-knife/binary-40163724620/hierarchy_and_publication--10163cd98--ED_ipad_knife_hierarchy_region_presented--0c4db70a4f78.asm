
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163cd98 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti>:
10163cd98:     	sub	sp, sp, #0x60
10163cd9c:     	stp	x22, x21, [sp, #0x30]
10163cda0:     	stp	x20, x19, [sp, #0x40]
10163cda4:     	stp	x29, x30, [sp, #0x50]
10163cda8:     	add	x29, sp, #0x50
10163cdac:     	mov	x21, x4
10163cdb0:     	mov	x19, x3
10163cdb4:     	mov	x20, x2
10163cdb8:     	mov	x22, x1
10163cdbc:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163cdc0:     	cbz	x22, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cdc4:     	cbz	x0, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cdc8:     	add	x0, x0, #0x1a0
10163cdcc:     	mov	x1, x22
10163cdd0:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163cdd4:     	cbz	x19, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cdd8:     	cbz	x20, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cddc:     	cmn	w0, #0x1
10163cde0:     	b.eq	0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cde4:     	ldp	w9, w8, [x21]
10163cde8:     	cmp	w8, w9
10163cdec:     	b.le	0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cdf0:     	ldp	w9, w8, [x21, #0x8]
10163cdf4:     	cmp	w8, w9
10163cdf8:     	b.le	0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cdfc:     	mov	x0, x22
10163ce00:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163ce04:     	cbz	x0, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163ce08:     	add	x0, x0, #0x1c0
10163ce0c:     	mov	x1, x20
10163ce10:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163ce14:     	cmn	w0, #0x1
10163ce18:     	b.eq	0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163ce1c:     	add	x0, x20, #0x78
10163ce20:     	mov	x1, x19
10163ce24:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163ce28:     	cmn	w0, #0x1
10163ce2c:     	b.eq	0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163ce30:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163ce34:     	ldr	x8, [x8, #0x9b0]
10163ce38:     	cbz	x8, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163ce3c:     	fmov	d0, x8
10163ce40:     	cnt.8b	v0, v0
10163ce44:     	uaddlv.8b	h0, v0
10163ce48:     	fmov	w9, s0
10163ce4c:     	cmp	x9, #0x1
10163ce50:     	b.hi	0x10163ce60 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xc8>
10163ce54:     	sub	x10, x8, #0x1
10163ce58:     	and	x11, x10, x22
10163ce5c:     	b	0x10163ce74 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xdc>
10163ce60:     	mov	x11, x22
10163ce64:     	cmp	x8, x22
10163ce68:     	b.hi	0x10163ce74 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xdc>
10163ce6c:     	udiv	x10, x22, x8
10163ce70:     	msub	x11, x10, x8, x22
10163ce74:     	adrp	x10, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163ce78:     	ldr	x10, [x10, #0x9a8]
10163ce7c:     	ldr	x10, [x10, x11, lsl #3]
10163ce80:     	cbz	x10, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163ce84:     	ldr	x10, [x10]
10163ce88:     	cbz	x10, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163ce8c:     	sub	x12, x8, #0x1
10163ce90:     	b	0x10163cea8 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x110>
10163ce94:     	ldr	x13, [x10, #0x10]
10163ce98:     	cmp	x13, x22
10163ce9c:     	b.eq	0x10163cee0 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x148>
10163cea0:     	ldr	x10, [x10]
10163cea4:     	cbz	x10, 0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cea8:     	ldr	x13, [x10, #0x8]
10163ceac:     	cmp	x13, x22
10163ceb0:     	b.eq	0x10163ce94 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0xfc>
10163ceb4:     	cmp	x9, #0x1
10163ceb8:     	b.hi	0x10163cec4 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x12c>
10163cebc:     	and	x13, x13, x12
10163cec0:     	b	0x10163ced4 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x13c>
10163cec4:     	cmp	x13, x8
10163cec8:     	b.lo	0x10163ced4 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x13c>
10163cecc:     	udiv	x14, x13, x8
10163ced0:     	msub	x13, x14, x8, x13
10163ced4:     	cmp	x13, x11
10163ced8:     	b.eq	0x10163cea0 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x108>
10163cedc:     	b	0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cee0:     	ldrb	w8, [x10, #0x20]
10163cee4:     	cmp	w8, #0x1
10163cee8:     	b.ne	0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163ceec:     	ldr	x8, [x10, #0x18]
10163cef0:     	ldrsw	x9, [x22, #0xc0]
10163cef4:     	cmp	x8, x9
10163cef8:     	b.ne	0x10163cf30 <__Z40ED_ipad_knife_hierarchy_region_presentedP8bContextP8wmWindowP7ScrAreaP7ARegionRK4rcti+0x198>
10163cefc:     	ldp	w8, w9, [x21]
10163cf00:     	ldp	w11, w12, [x21, #0x8]
10163cf04:     	sub	w9, w9, #0x1
10163cf08:     	sub	w12, w12, #0x1
10163cf0c:     	stp	x20, x19, [sp, #0x8]
10163cf10:     	ldr	x13, [x19, #0x128]
10163cf14:     	ldr	x13, [x13, #0x298]
10163cf18:     	str	x13, [sp, #0x18]
10163cf1c:     	stp	w8, w9, [sp, #0x20]
10163cf20:     	stp	w11, w12, [sp, #0x28]
10163cf24:     	add	x0, x10, #0x188
10163cf28:     	add	x1, sp, #0x8
10163cf2c:     	bl	0x10163cf44 <__ZNSt3__16vectorIN12_GLOBAL__N_124IPadKnifeHierarchyRegionENS_9allocatorIS2_EEE9push_backB8ne190102EOS2_>
10163cf30:     	ldp	x29, x30, [sp, #0x50]
10163cf34:     	ldp	x20, x19, [sp, #0x40]
10163cf38:     	ldp	x22, x21, [sp, #0x30]
10163cf3c:     	add	sp, sp, #0x60
10163cf40:     	ret
