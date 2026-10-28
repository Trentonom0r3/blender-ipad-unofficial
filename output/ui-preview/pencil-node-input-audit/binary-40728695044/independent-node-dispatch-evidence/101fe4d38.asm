
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fe4d38 <__ZL14view_zoom_pollP8bContext>:
101fe4d38:     	stp	x20, x19, [sp, #-0x20]!
101fe4d3c:     	stp	x29, x30, [sp, #0x10]
101fe4d40:     	add	x29, sp, #0x10
101fe4d44:     	mov	x20, x0
101fe4d48:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101fe4d4c:     	cbz	x0, 0x101fe4d78 <__ZL14view_zoom_pollP8bContext+0x40>
101fe4d50:     	mov	x19, x0
101fe4d54:     	mov	x0, x20
101fe4d58:     	bl	0x1000b44e8 <__Z20CTX_wm_region_view3dPK8bContext>
101fe4d5c:     	cbz	x0, 0x101fe4d68 <__ZL14view_zoom_pollP8bContext+0x30>
101fe4d60:     	mov	w0, #0x0                ; =0
101fe4d64:     	b	0x101fe4d78 <__ZL14view_zoom_pollP8bContext+0x40>
101fe4d68:     	ldrh	w8, [x19, #0x7e]
101fe4d6c:     	mov	w9, #0x300              ; =768
101fe4d70:     	bics	wzr, w9, w8
101fe4d74:     	cset	w0, ne
101fe4d78:     	ldp	x29, x30, [sp, #0x10]
101fe4d7c:     	ldp	x20, x19, [sp], #0x20
101fe4d80:     	ret
