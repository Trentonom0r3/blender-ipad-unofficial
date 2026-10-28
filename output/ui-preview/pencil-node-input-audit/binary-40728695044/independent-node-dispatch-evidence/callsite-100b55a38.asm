
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b550cc <__Z20wm_event_do_handlersP8bContext>:
100b55a10:     	bl	0x100b571d4 <__ZL29wm_ipad_knife_request_resolveP8bContextP8wmWindowPK7wmEventPP17wmEventHandler_OpPP7ScrAreaPP7ARegion>
100b55a14:     	cbz	w0, 0x100b55a68 <__Z20wm_event_do_handlersP8bContext+0x99c>
100b55a18:     	ldr	x2, [sp, #0x50]
100b55a1c:     	add	x1, x21, #0x118
100b55a20:     	mov	x0, x19
100b55a24:     	mov	x3, x26
100b55a28:     	mov	x4, #0x0                ; =0
100b55a2c:     	mov	x5, #0x0                ; =0
100b55a30:     	mov	w6, #0x0                ; =0
100b55a34:     	mov	w7, #0x0                ; =0
100b55a38:     	bl	0x100b524d0 <__ZL24wm_handler_operator_callP8bContextP8ListBaseP14wmEventHandlerP7wmEventP10PointerRNAPKcb23eIPadNodeView2DDispatch>
100b55a3c:     	b	0x100b55a68 <__Z20wm_event_do_handlersP8bContext+0x99c>
100b55a40:     	and	w8, w20, #0xff
