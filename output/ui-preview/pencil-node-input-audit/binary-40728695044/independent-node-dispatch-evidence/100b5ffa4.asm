
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5ffa4 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig>:
100b5ffa4:     	ldr	x8, [x0, #0x90]
100b5ffa8:     	cbz	x8, 0x100b60004 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig+0x60>
100b5ffac:     	mov	x11, #0x0               ; =0
100b5ffb0:     	mov	w9, #0x6956             ; =26966
100b5ffb4:     	movk	w9, #0x7765, lsl #16
100b5ffb8:     	mov	w10, #0x4432            ; =17458
100b5ffbc:     	ldr	w12, [x8, #0x30]
100b5ffc0:     	ldrh	w13, [x8, #0x34]
100b5ffc4:     	cmp	w12, w9
100b5ffc8:     	ccmp	w13, w10, #0x0, eq
100b5ffcc:     	b.ne	0x100b5ffe8 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig+0x44>
100b5ffd0:     	ldrb	w12, [x8, #0x36]
100b5ffd4:     	cbnz	w12, 0x100b5ffe8 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig+0x44>
100b5ffd8:     	ldrh	w12, [x8, #0x70]
100b5ffdc:     	cbnz	w12, 0x100b5ffe8 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig+0x44>
100b5ffe0:     	ldrh	w12, [x8, #0x72]
100b5ffe4:     	cbz	w12, 0x100b5fffc <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig+0x58>
100b5ffe8:     	mov	x0, x11
100b5ffec:     	ldr	x8, [x8]
100b5fff0:     	mov	x11, x0
100b5fff4:     	cbnz	x8, 0x100b5ffbc <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig+0x18>
100b5fff8:     	b	0x100b60008 <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig+0x64>
100b5fffc:     	mov	x0, x8
100b60000:     	cbz	x11, 0x100b5ffec <__ZL28wm_ipad_node_view2d_map_findPK11wmKeyConfig+0x48>
100b60004:     	mov	x0, #0x0                ; =0
100b60008:     	ret
