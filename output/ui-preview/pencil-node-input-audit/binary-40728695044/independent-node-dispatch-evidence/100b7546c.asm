
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b7546c <__Z14WM_keymap_pollP8bContextP8wmKeyMap>:
100b7546c:     	stp	x22, x21, [sp, #-0x30]!
100b75470:     	stp	x20, x19, [sp, #0x10]
100b75474:     	stp	x29, x30, [sp, #0x20]
100b75478:     	add	x29, sp, #0x20
100b7547c:     	mov	x20, x1
100b75480:     	mov	x19, x0
100b75484:     	mov	x21, x1
100b75488:     	ldrb	w8, [x21, #0x74]!
100b7548c:     	cbz	w8, 0x100b754a4 <__Z14WM_keymap_pollP8bContextP8wmKeyMap+0x38>
100b75490:     	mov	x0, x19
100b75494:     	bl	0x1000b43e0 <__Z16CTX_wm_workspacePK8bContext>
100b75498:     	mov	x1, x21
100b7549c:     	bl	0x10072a004 <__Z28BKE_workspace_owner_id_checkPK9WorkSpacePKc>
100b754a0:     	cbz	w0, 0x100b754dc <__Z14WM_keymap_pollP8bContextP8wmKeyMap+0x70>
100b754a4:     	ldr	x8, [x20, #0x10]
100b754a8:     	cbz	x8, 0x100b754c8 <__Z14WM_keymap_pollP8bContextP8wmKeyMap+0x5c>
100b754ac:     	ldr	x1, [x20, #0xf8]
100b754b0:     	cbz	x1, 0x100b754d8 <__Z14WM_keymap_pollP8bContextP8wmKeyMap+0x6c>
100b754b4:     	mov	x0, x19
100b754b8:     	ldp	x29, x30, [sp, #0x20]
100b754bc:     	ldp	x20, x19, [sp, #0x10]
100b754c0:     	ldp	x22, x21, [sp], #0x30
100b754c4:     	br	x1
100b754c8:     	mov	x0, x20
100b754cc:     	bl	0x104a604ac <__Z14WM_keymap_pollP8bContextP8wmKeyMap.cold.1>
100b754d0:     	ldr	x1, [x20, #0xf8]
100b754d4:     	cbnz	x1, 0x100b754b4 <__Z14WM_keymap_pollP8bContextP8wmKeyMap+0x48>
100b754d8:     	mov	w0, #0x1                ; =1
100b754dc:     	ldp	x29, x30, [sp, #0x20]
100b754e0:     	ldp	x20, x19, [sp, #0x10]
100b754e4:     	ldp	x22, x21, [sp], #0x30
100b754e8:     	ret
