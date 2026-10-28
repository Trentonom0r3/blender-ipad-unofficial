
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000104a60190 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.2>:
104a60190:     	stp	x22, x21, [sp, #-0x30]!
104a60194:     	stp	x20, x19, [sp, #0x10]
104a60198:     	stp	x29, x30, [sp, #0x20]
104a6019c:     	add	x29, sp, #0x20
104a601a0:     	mov	x19, x3
104a601a4:     	mov	x20, x1
104a601a8:     	mov	w8, #0x1                ; =1
104a601ac:     	strh	w8, [x0]
104a601b0:     	ldr	x8, [x1, #0x168]
104a601b4:     	strb	wzr, [x8, #0x58]
104a601b8:     	mov	w8, #0x19               ; =25
104a601bc:     	strh	w8, [x2]
104a601c0:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
104a601c4:     	add	x8, x8, #0x760
104a601c8:     	ldr	x8, [x8]
104a601cc:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
104a601d0:     	add	x3, x3, #0xa9d
104a601d4:     	bl	0x100b62884 <_OUTLINED_FUNCTION_0>
104a601d8:     	bl	0x100b628d8 <_OUTLINED_FUNCTION_7>
104a601dc:     	ldr	x0, [x20, #0x168]
104a601e0:     	mov	x1, x21
104a601e4:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
104a601e8:     	ldp	x29, x30, [sp, #0x20]
104a601ec:     	b	0x1000e6dd0 <_OUTLINED_FUNCTION_8>
