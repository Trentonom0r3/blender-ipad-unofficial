
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f40e4c <__ZL26ui_ipad_hud_single_numericPK5uiBut>:
101f40e4c:     	ldr	x8, [x0, #0x3d0]
101f40e50:     	cbz	x8, 0x101f40e64 <__ZL26ui_ipad_hud_single_numericPK5uiBut+0x18>
101f40e54:     	ldrb	w9, [x8, #0x114]
101f40e58:     	tbz	w9, #0x0, 0x101f40e6c <__ZL26ui_ipad_hud_single_numericPK5uiBut+0x20>
101f40e5c:     	mov	w0, #0x0                ; =0
101f40e60:     	ret
101f40e64:     	mov	w0, #0x1                ; =1
101f40e68:     	ret
101f40e6c:     	ldr	x9, [x8, #0x118]
101f40e70:     	cbz	x9, 0x101f40e7c <__ZL26ui_ipad_hud_single_numericPK5uiBut+0x30>
101f40e74:     	mov	w0, #0x0                ; =0
101f40e78:     	ret
101f40e7c:     	ldr	x9, [x8, #0x120]
101f40e80:     	cbz	x9, 0x101f40e8c <__ZL26ui_ipad_hud_single_numericPK5uiBut+0x40>
101f40e84:     	mov	w0, #0x0                ; =0
101f40e88:     	ret
101f40e8c:     	ldr	w9, [x8, #0x110]
101f40e90:     	sub	w9, w9, #0x1
101f40e94:     	cmp	w9, #0x2
101f40e98:     	b.hs	0x101f40ea4 <__ZL26ui_ipad_hud_single_numericPK5uiBut+0x58>
101f40e9c:     	mov	w0, #0x0                ; =0
101f40ea0:     	ret
101f40ea4:     	ldrb	w9, [x8, #0x2e1]
101f40ea8:     	tbz	w9, #0x0, 0x101f40eb4 <__ZL26ui_ipad_hud_single_numericPK5uiBut+0x68>
101f40eac:     	mov	w0, #0x0                ; =0
101f40eb0:     	ret
101f40eb4:     	ldp	x9, x8, [x8, #0x140]
101f40eb8:     	cmp	x9, x8
101f40ebc:     	cset	w0, eq
101f40ec0:     	ret
