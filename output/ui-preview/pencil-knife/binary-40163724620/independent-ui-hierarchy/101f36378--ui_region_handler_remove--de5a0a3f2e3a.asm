
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f36378 <__ZL24ui_region_handler_removeP8bContextPv>:
101f36378:     	stp	x20, x19, [sp, #-0x20]!
101f3637c:     	stp	x29, x30, [sp, #0x10]
101f36380:     	add	x29, sp, #0x10
101f36384:     	mov	x19, x0
101f36388:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
101f3638c:     	cbz	x0, 0x101f363c0 <__ZL24ui_region_handler_removeP8bContextPv+0x48>
101f36390:     	mov	x20, x0
101f36394:     	mov	x0, x19
101f36398:     	mov	x1, x20
101f3639c:     	bl	0x101f11290 <__Z17UI_blocklist_freePK8bContextP7ARegion>
101f363a0:     	mov	x0, x19
101f363a4:     	bl	0x1000b3bb8 <__Z13CTX_wm_screenPK8bContext>
101f363a8:     	cbz	x0, 0x101f363c0 <__ZL24ui_region_handler_removeP8bContextPv+0x48>
101f363ac:     	add	x0, x0, #0x1d0
101f363b0:     	mov	x1, x20
101f363b4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
101f363b8:     	cmn	w0, #0x1
101f363bc:     	b.eq	0x101f363cc <__ZL24ui_region_handler_removeP8bContextPv+0x54>
101f363c0:     	ldp	x29, x30, [sp, #0x10]
101f363c4:     	ldp	x20, x19, [sp], #0x20
101f363c8:     	ret
101f363cc:     	mov	x0, x19
101f363d0:     	ldp	x29, x30, [sp, #0x10]
101f363d4:     	ldp	x20, x19, [sp], #0x20
101f363d8:     	b	0x101f42598 <__ZL24ui_apply_but_funcs_afterP8bContext>
