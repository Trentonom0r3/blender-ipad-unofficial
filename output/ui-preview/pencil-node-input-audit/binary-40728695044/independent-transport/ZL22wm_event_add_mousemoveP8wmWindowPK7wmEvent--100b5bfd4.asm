
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5bfd4 <__ZL22wm_event_add_mousemoveP8wmWindowPK7wmEvent>:
100b5bfd4:     	stp	x22, x21, [sp, #-0x30]!
100b5bfd8:     	stp	x20, x19, [sp, #0x10]
100b5bfdc:     	stp	x29, x30, [sp, #0x20]
100b5bfe0:     	add	x29, sp, #0x20
100b5bfe4:     	mov	x20, x1
100b5bfe8:     	mov	x19, x0
100b5bfec:     	ldr	x8, [x0, #0x168]
100b5bff0:     	ldr	x22, [x8, #0x8]
100b5bff4:     	cbz	x22, 0x100b5c018 <__ZL22wm_event_add_mousemoveP8wmWindowPK7wmEvent+0x44>
100b5bff8:     	ldrh	w8, [x22, #0x10]
100b5bffc:     	cmp	w8, #0x4
100b5c000:     	b.ne	0x100b5c018 <__ZL22wm_event_add_mousemoveP8wmWindowPK7wmEvent+0x44>
100b5c004:     	mov	w8, #0x11               ; =17
100b5c008:     	strh	w8, [x22, #0x10]
100b5c00c:     	ldr	w8, [x22, #0x7c]
100b5c010:     	and	w8, w8, #0x80
100b5c014:     	str	w8, [x22, #0x7c]
100b5c018:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
100b5c01c:     	add	x8, x8, #0x760
100b5c020:     	ldr	x8, [x8]
100b5c024:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
100b5c028:     	add	x3, x3, #0xa9d
100b5c02c:     	mov	w0, #0x1                ; =1
100b5c030:     	mov	w1, #0xb0               ; =176
100b5c034:     	mov	w2, #0x8                ; =8
100b5c038:     	blr	x8
100b5c03c:     	mov	x21, x0
100b5c040:     	ldp	q1, q0, [x20, #0x10]
100b5c044:     	ldr	q2, [x20]
100b5c048:     	stp	q2, q1, [x0]
100b5c04c:     	str	q0, [x0, #0x20]
100b5c050:     	ldp	q0, q1, [x20, #0x50]
100b5c054:     	ldp	q3, q2, [x20, #0x30]
100b5c058:     	stp	q0, q1, [x0, #0x50]
100b5c05c:     	stp	q3, q2, [x0, #0x30]
100b5c060:     	ldp	q0, q1, [x20, #0x90]
100b5c064:     	ldp	q3, q2, [x20, #0x70]
100b5c068:     	stp	q0, q1, [x0, #0x90]
100b5c06c:     	stp	q3, q2, [x0, #0x70]
100b5c070:     	ldr	x0, [x19, #0x168]
100b5c074:     	mov	x1, x21
100b5c078:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
100b5c07c:     	cbnz	x22, 0x100b5c084 <__ZL22wm_event_add_mousemoveP8wmWindowPK7wmEvent+0xb0>
100b5c080:     	ldr	x22, [x19, #0xf0]
100b5c084:     	ldr	w8, [x22, #0x14]
100b5c088:     	str	w8, [x21, #0x94]
100b5c08c:     	ldr	w8, [x22, #0x18]
100b5c090:     	str	w8, [x21, #0x98]
100b5c094:     	mov	x0, x21
100b5c098:     	ldp	x29, x30, [sp, #0x20]
100b5c09c:     	ldp	x20, x19, [sp, #0x10]
100b5c0a0:     	ldp	x22, x21, [sp], #0x30
100b5c0a4:     	ret
