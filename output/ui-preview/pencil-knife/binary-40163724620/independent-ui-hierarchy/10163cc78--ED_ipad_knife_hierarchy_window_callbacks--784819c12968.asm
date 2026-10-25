
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163cc78 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb>:
10163cc78:     	stp	x20, x19, [sp, #-0x20]!
10163cc7c:     	stp	x29, x30, [sp, #0x10]
10163cc80:     	add	x29, sp, #0x10
10163cc84:     	mov	x19, x2
10163cc88:     	mov	x20, x1
10163cc8c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163cc90:     	cbz	x20, 0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163cc94:     	cbz	x0, 0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163cc98:     	add	x0, x0, #0x1a0
10163cc9c:     	mov	x1, x20
10163cca0:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
10163cca4:     	cmn	w0, #0x1
10163cca8:     	b.eq	0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163ccac:     	adrp	x8, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163ccb0:     	ldr	x8, [x8, #0x9b0]
10163ccb4:     	cbz	x8, 0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163ccb8:     	fmov	d0, x8
10163ccbc:     	cnt.8b	v0, v0
10163ccc0:     	uaddlv.8b	h0, v0
10163ccc4:     	fmov	w9, s0
10163ccc8:     	cmp	x9, #0x1
10163cccc:     	b.hi	0x10163ccdc <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x64>
10163ccd0:     	sub	x10, x8, #0x1
10163ccd4:     	and	x10, x10, x20
10163ccd8:     	b	0x10163ccf0 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x78>
10163ccdc:     	mov	x10, x20
10163cce0:     	cmp	x8, x20
10163cce4:     	b.hi	0x10163ccf0 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x78>
10163cce8:     	udiv	x10, x20, x8
10163ccec:     	msub	x10, x10, x8, x20
10163ccf0:     	adrp	x11, 0x107f0b000 <__ZN9Freestyle6ConfigL7DIR_SEPE>
10163ccf4:     	ldr	x11, [x11, #0x9a8]
10163ccf8:     	ldr	x11, [x11, x10, lsl #3]
10163ccfc:     	cbz	x11, 0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163cd00:     	ldr	x11, [x11]
10163cd04:     	cbz	x11, 0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163cd08:     	sub	x12, x8, #0x1
10163cd0c:     	b	0x10163cd24 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0xac>
10163cd10:     	ldr	x13, [x11, #0x10]
10163cd14:     	cmp	x13, x20
10163cd18:     	b.eq	0x10163cd5c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0xe4>
10163cd1c:     	ldr	x11, [x11]
10163cd20:     	cbz	x11, 0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163cd24:     	ldr	x13, [x11, #0x8]
10163cd28:     	cmp	x13, x20
10163cd2c:     	b.eq	0x10163cd10 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x98>
10163cd30:     	cmp	x9, #0x1
10163cd34:     	b.hi	0x10163cd40 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0xc8>
10163cd38:     	and	x13, x13, x12
10163cd3c:     	b	0x10163cd50 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0xd8>
10163cd40:     	cmp	x13, x8
10163cd44:     	b.lo	0x10163cd50 <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0xd8>
10163cd48:     	udiv	x14, x13, x8
10163cd4c:     	msub	x13, x14, x8, x13
10163cd50:     	cmp	x13, x10
10163cd54:     	b.eq	0x10163cd1c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0xa4>
10163cd58:     	b	0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163cd5c:     	ldrb	w8, [x11, #0x20]
10163cd60:     	cmp	w8, #0x1
10163cd64:     	b.ne	0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163cd68:     	ldr	x8, [x11, #0x18]
10163cd6c:     	ldrsw	x9, [x20, #0xc0]
10163cd70:     	cmp	x8, x9
10163cd74:     	b.ne	0x10163cd8c <__Z40ED_ipad_knife_hierarchy_window_callbacksP8bContextP8wmWindowb+0x114>
10163cd78:     	mov	w8, #0x1                ; =1
10163cd7c:     	strb	w8, [x11, #0x21]
10163cd80:     	ldrb	w8, [x11, #0x22]
10163cd84:     	orr	w8, w8, w19
10163cd88:     	strb	w8, [x11, #0x22]
10163cd8c:     	ldp	x29, x30, [sp, #0x10]
10163cd90:     	ldp	x20, x19, [sp], #0x20
10163cd94:     	ret
