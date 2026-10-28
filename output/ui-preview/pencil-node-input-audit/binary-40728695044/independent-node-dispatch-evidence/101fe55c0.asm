
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101fe55c0 <__ZL13view_pan_pollP8bContext>:
101fe55c0:     	stp	x29, x30, [sp, #-0x10]!
101fe55c4:     	mov	x29, sp
101fe55c8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101fe55cc:     	cbz	x0, 0x101fe55e0 <__ZL13view_pan_pollP8bContext+0x20>
101fe55d0:     	ldrh	w8, [x0, #0x80]
101fe55d4:     	mov	w9, #0x6                ; =6
101fe55d8:     	bics	wzr, w9, w8
101fe55dc:     	cset	w0, ne
101fe55e0:     	ldp	x29, x30, [sp], #0x10
101fe55e4:     	ret
