
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c37040 <__ZL17knifetool_exit_exP16KnifeTool_OpData>:
101c37040:     	stp	x20, x19, [sp, #-0x20]!
101c37044:     	stp	x29, x30, [sp, #0x10]
101c37048:     	add	x29, sp, #0x10
101c3704c:     	cbz	x0, 0x101c37164 <__ZL17knifetool_exit_exP16KnifeTool_OpData+0x124>
101c37050:     	mov	x19, x0
101c37054:     	ldrb	w8, [x0, #0x383]
101c37058:     	cmp	w8, #0x1
101c3705c:     	b.ne	0x101c37078 <__ZL17knifetool_exit_exP16KnifeTool_OpData+0x38>
101c37060:     	ldr	x0, [x19, #0x58]
101c37064:     	bl	0x100b44588 <__Z23WM_cursor_modal_restoreP8wmWindow>
101c37068:     	ldp	x8, x1, [x19]
101c3706c:     	ldr	x8, [x8, #0x128]
101c37070:     	ldr	x0, [x8, #0xb8]
101c37074:     	bl	0x101b4ac7c <__Z22ED_region_draw_cb_exitP11ARegionTypePv>
101c37078:     	ldr	x0, [x19, #0x358]
101c3707c:     	bl	0x1007323a4 <__Z19BLI_mempool_destroyP11BLI_mempool>
101c37080:     	ldr	x0, [x19, #0x138]
101c37084:     	bl	0x1007323a4 <__Z19BLI_mempool_destroyP11BLI_mempool>
101c37088:     	ldr	x0, [x19, #0x140]
101c3708c:     	bl	0x1007323a4 <__Z19BLI_mempool_destroyP11BLI_mempool>
101c37090:     	ldr	x0, [x19, #0x150]
101c37094:     	bl	0x100819054 <__Z14BLI_stack_freeP9BLI_Stack>
101c37098:     	ldr	x0, [x19, #0x158]
101c3709c:     	bl	0x100819054 <__Z14BLI_stack_freeP9BLI_Stack>
101c370a0:     	ldr	x0, [x19, #0xf0]
101c370a4:     	mov	x1, #0x0                ; =0
101c370a8:     	mov	x2, #0x0                ; =0
101c370ac:     	bl	0x10072c7d4 <__Z14BLI_ghash_freeP5GHashPFvPvES3_>
101c370b0:     	ldr	x0, [x19, #0xe8]
101c370b4:     	mov	x1, #0x0                ; =0
101c370b8:     	mov	x2, #0x0                ; =0
101c370bc:     	bl	0x10072c7d4 <__Z14BLI_ghash_freeP5GHashPFvPvES3_>
101c370c0:     	ldr	x0, [x19, #0xf8]
101c370c4:     	mov	x1, #0x0                ; =0
101c370c8:     	mov	x2, #0x0                ; =0
101c370cc:     	bl	0x10072c7d4 <__Z14BLI_ghash_freeP5GHashPFvPvES3_>
101c370d0:     	ldr	x0, [x19, #0x100]
101c370d4:     	mov	x1, #0x0                ; =0
101c370d8:     	mov	x2, #0x0                ; =0
101c370dc:     	bl	0x10072c7d4 <__Z14BLI_ghash_freeP5GHashPFvPvES3_>
101c370e0:     	ldr	x0, [x19, #0xd0]
101c370e4:     	bl	0x1007313d4 <__Z17BLI_memarena_freeP8MemArena>
101c370e8:     	ldr	x0, [x19, #0xe0]
101c370ec:     	bl	0x1007313d4 <__Z17BLI_memarena_freeP8MemArena>
101c370f0:     	ldr	x0, [x19, #0xd8]
101c370f4:     	mov	x1, #0x0                ; =0
101c370f8:     	bl	0x10072cd98 <__Z13BLI_gset_freeP4GSetPFvPvE>
101c370fc:     	ldr	x0, [x19]
101c37100:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c37104:     	ldr	x0, [x19, #0x108]
101c37108:     	cbz	x0, 0x101c37114 <__ZL17knifetool_exit_exP16KnifeTool_OpData+0xd4>
101c3710c:     	bl	0x10072de4c <__Z16BLI_bvhtree_freeP7BVHTree>
101c37110:     	str	xzr, [x19, #0x108]
101c37114:     	ldr	x0, [x19, #0x168]
101c37118:     	add	x8, x19, #0x180
101c3711c:     	cmp	x0, x8
101c37120:     	b.eq	0x101c37128 <__ZL17knifetool_exit_exP16KnifeTool_OpData+0xe8>
101c37124:     	bl	0x100ae425c <_MEM_freeN>
101c37128:     	add	x0, x19, #0xc0
101c3712c:     	bl	0x101c3f9b0 <__ZN7blender5ArrayI15KnifeObjectInfoLx0ENS_16GuardedAllocatorEED2Ev>
101c37130:     	ldr	x0, [x19, #0x80]
101c37134:     	add	x8, x19, #0x98
101c37138:     	cmp	x0, x8
101c3713c:     	b.eq	0x101c37144 <__ZL17knifetool_exit_exP16KnifeTool_OpData+0x104>
101c37140:     	bl	0x100ae425c <_MEM_freeN>
101c37144:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
101c37148:     	add	x8, x8, #0x690
101c3714c:     	ldr	x2, [x8]
101c37150:     	mov	x0, x19
101c37154:     	mov	w1, #0x1                ; =1
101c37158:     	ldp	x29, x30, [sp, #0x10]
101c3715c:     	ldp	x20, x19, [sp], #0x20
101c37160:     	br	x2
101c37164:     	ldp	x29, x30, [sp, #0x10]
101c37168:     	ldp	x20, x19, [sp], #0x20
101c3716c:     	ret
101c37170:     	bl	0x1000144bc <___clang_call_terminate>
101c37174:     	bl	0x1000144bc <___clang_call_terminate>
