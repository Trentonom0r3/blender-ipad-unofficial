
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5d8f8 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch>:
100b5d8f8:     	stp	x22, x21, [sp, #-0x30]!
100b5d8fc:     	stp	x20, x19, [sp, #0x10]
100b5d900:     	stp	x29, x30, [sp, #0x20]
100b5d904:     	add	x29, sp, #0x20
100b5d908:     	mov	x19, x0
100b5d90c:     	mov	w0, #0x0                ; =0
100b5d910:     	cbz	x19, 0x100b5d95c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x64>
100b5d914:     	cbz	x1, 0x100b5d95c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x64>
100b5d918:     	cbz	w2, 0x100b5d95c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x64>
100b5d91c:     	mov	x20, x2
100b5d920:     	mov	x21, x1
100b5d924:     	mov	x0, x19
100b5d928:     	bl	0x1000b1ebc <__Z15CTX_py_dict_getPK8bContext>
100b5d92c:     	cbnz	x0, 0x100b5d958 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x60>
100b5d930:     	ldr	w9, [x21, #0x7c]
100b5d934:     	and	w9, w9, #0x3f8
100b5d938:     	cmp	w9, #0x200
100b5d93c:     	b.ne	0x100b5d958 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x60>
100b5d940:     	mov	x8, x21
100b5d944:     	ldrh	w9, [x21, #0x10]
100b5d948:     	cmp	w9, #0xe
100b5d94c:     	b.ne	0x100b5d958 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x60>
100b5d950:     	ldrh	w9, [x8, #0x12]
100b5d954:     	cbz	w9, 0x100b5d96c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x74>
100b5d958:     	mov	w0, #0x0                ; =0
100b5d95c:     	ldp	x29, x30, [sp, #0x20]
100b5d960:     	ldp	x20, x19, [sp, #0x10]
100b5d964:     	ldp	x22, x21, [sp], #0x30
100b5d968:     	ret
100b5d96c:     	mov	w0, #0x0                ; =0
100b5d970:     	sub	w9, w20, #0x1
100b5d974:     	cmp	w9, #0x1
100b5d978:     	b.hi	0x100b5d95c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x64>
100b5d97c:     	ldrh	w9, [x8, #0x2c]
100b5d980:     	cbnz	w9, 0x100b5d95c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x64>
100b5d984:     	cmp	w20, #0x1
100b5d988:     	cset	w9, ne
100b5d98c:     	ldrb	w8, [x8, #0x2a]
100b5d990:     	cmp	w8, w9, lsl #1
100b5d994:     	b.ne	0x100b5d958 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x60>
100b5d998:     	mov	x0, x19
100b5d99c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b5d9a0:     	mov	x20, x0
100b5d9a4:     	mov	x0, x19
100b5d9a8:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b5d9ac:     	cbz	x20, 0x100b5d958 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x60>
100b5d9b0:     	mov	x1, x0
100b5d9b4:     	mov	w0, #0x0                ; =0
100b5d9b8:     	ldrb	w8, [x20, #0x48]
100b5d9bc:     	cmp	w8, #0x10
100b5d9c0:     	b.ne	0x100b5d95c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x64>
100b5d9c4:     	cbz	x1, 0x100b5d95c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x64>
100b5d9c8:     	ldrh	w8, [x1, #0xc0]
100b5d9cc:     	cbnz	w8, 0x100b5d958 <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x60>
100b5d9d0:     	add	x0, x20, #0x78
100b5d9d4:     	bl	0x10078ff60 <__Z13BLI_findindexPK8ListBasePKv>
100b5d9d8:     	mvn	w8, w0
100b5d9dc:     	lsr	w0, w8, #31
100b5d9e0:     	b	0x100b5d95c <__ZL33wm_ipad_node_view2d_event_contextP8bContextPK7wmEvent23eIPadNodeView2DDispatch+0x64>
