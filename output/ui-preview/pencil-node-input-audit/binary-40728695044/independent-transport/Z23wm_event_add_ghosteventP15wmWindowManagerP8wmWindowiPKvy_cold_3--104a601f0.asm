
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000104a601f0 <__Z23wm_event_add_ghosteventP15wmWindowManagerP8wmWindowiPKvy.cold.3>:
104a601f0:     	stp	x22, x21, [sp, #-0x30]!
104a601f4:     	stp	x20, x19, [sp, #0x10]
104a601f8:     	stp	x29, x30, [sp, #0x20]
104a601fc:     	add	x29, sp, #0x20
104a60200:     	bl	0x100b628cc <_OUTLINED_FUNCTION_6>
104a60204:     	ldr	x8, [x1, #0x30]
104a60208:     	ldr	w9, [x1, #0x38]
104a6020c:     	str	w9, [x0, #0x38]
104a60210:     	str	x8, [x0, #0x30]
104a60214:     	ldr	x8, [x2]
104a60218:     	str	x0, [x8, #0x50]
104a6021c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
104a60220:     	add	x8, x8, #0x760
104a60224:     	ldr	x8, [x8]
104a60228:     	adrp	x3, 0x104bd4000 <__ZL3hex+0x45cd>
104a6022c:     	add	x3, x3, #0xa9d
104a60230:     	bl	0x100b62884 <_OUTLINED_FUNCTION_0>
104a60234:     	bl	0x100b628d8 <_OUTLINED_FUNCTION_7>
104a60238:     	ldr	x0, [x20]
104a6023c:     	mov	x1, x21
104a60240:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
104a60244:     	ldp	x29, x30, [sp, #0x20]
104a60248:     	b	0x1000e6dd0 <_OUTLINED_FUNCTION_8>
