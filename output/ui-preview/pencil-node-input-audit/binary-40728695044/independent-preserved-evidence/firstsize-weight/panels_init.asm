
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101625ff8 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion>:
101625ff8:     	stp	x20, x19, [sp, #-0x20]!
101625ffc:     	stp	x29, x30, [sp, #0x10]
101626000:     	add	x29, sp, #0x10
101626004:     	mov	x19, x1
101626008:     	mov	x20, x0
10162600c:     	ldrsh	w2, [x1, #0xb8]
101626010:     	ldrsh	w3, [x1, #0xba]
101626014:     	add	x0, x1, #0x10
101626018:     	mov	w1, #0x4                ; =4
10162601c:     	bl	0x101fdfcac <__Z23UI_view2d_region_reinitP6View2Dsii>
101626020:     	ldrh	w8, [x19, #0xc2]
101626024:     	tst	w8, #0x3
101626028:     	b.eq	0x101626034 <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x3c>
10162602c:     	mov	w8, #0x1                ; =1
101626030:     	b	0x10162603c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x44>
101626034:     	tbz	w8, #0x2, 0x10162604c <__Z21ED_region_panels_initP15wmWindowManagerP7ARegion+0x54>
101626038:     	mov	w8, #0x2                ; =2
10162603c:     	ldrh	w9, [x19, #0x78]
101626040:     	and	w9, w9, #0xfffc
101626044:     	orr	w8, w9, w8
101626048:     	strh	w8, [x19, #0x78]
10162604c:     	ldr	x8, [x20, #0x5c0]
101626050:     	ldr	x0, [x8, #0xc8]
101626054:     	adrp	x1, 0x104cfa000 <__ZL3hex+0x12a5cd>
101626058:     	add	x1, x1, #0xede
10162605c:     	mov	w2, #0x0                ; =0
101626060:     	mov	w3, #0x0                ; =0
101626064:     	bl	0x100b758f8 <__Z16WM_keymap_ensureP11wmKeyConfigPKcii>
101626068:     	mov	x1, x0
10162606c:     	ldr	x8, [x19, #0x128]
101626070:     	add	x0, x8, #0x328
101626074:     	ldp	x29, x30, [sp, #0x10]
101626078:     	ldp	x20, x19, [sp], #0x20
10162607c:     	b	0x100b597f8 <__Z27WM_event_add_keymap_handlerP8ListBaseP8wmKeyMap>
