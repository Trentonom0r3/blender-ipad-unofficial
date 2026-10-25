
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b50b84 <__Z30WM_ipad_knife_hud_scope_activePK8bContext>:
100b50b84:     	stp	x20, x19, [sp, #-0x20]!
100b50b88:     	stp	x29, x30, [sp, #0x10]
100b50b8c:     	add	x29, sp, #0x10
100b50b90:     	mov	x19, x0
100b50b94:     	adrp	x0, 0x106d86000 <__PyRuntime+0x280b8>
100b50b98:     	add	x0, x0, #0xb60
100b50b9c:     	ldr	x8, [x0]
100b50ba0:     	blr	x8
100b50ba4:     	cbz	x19, 0x100b50be4 <__Z30WM_ipad_knife_hud_scope_activePK8bContext+0x60>
100b50ba8:     	ldr	x8, [x0]
100b50bac:     	ldr	x9, [x0, #0x10]
100b50bb0:     	ldr	x10, [x0, #0x30]
100b50bb4:     	ldr	x11, [x0, #0x88]
100b50bb8:     	cmp	x8, #0x0
100b50bbc:     	ccmp	x9, #0x0, #0x4, ne
100b50bc0:     	ccmp	x10, #0x0, #0x4, ne
100b50bc4:     	ccmp	x11, #0x0, #0x4, ne
100b50bc8:     	b.eq	0x100b50be4 <__Z30WM_ipad_knife_hud_scope_activePK8bContext+0x60>
100b50bcc:     	ldr	x8, [x0, #0x98]
100b50bd0:     	ldp	x9, x10, [x0, #0xb8]
100b50bd4:     	cmp	x8, #0x0
100b50bd8:     	ccmp	x9, #0x0, #0x4, ne
100b50bdc:     	ccmp	x10, #0x0, #0x4, ne
100b50be0:     	b.ne	0x100b50bf4 <__Z30WM_ipad_knife_hud_scope_activePK8bContext+0x70>
100b50be4:     	mov	w0, #0x0                ; =0
100b50be8:     	ldp	x29, x30, [sp, #0x10]
100b50bec:     	ldp	x20, x19, [sp], #0x20
100b50bf0:     	ret
100b50bf4:     	mov	x20, x0
100b50bf8:     	mov	x0, x19
100b50bfc:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b50c00:     	mov	x1, x0
100b50c04:     	mov	x0, x19
100b50c08:     	mov	x2, x20
100b50c0c:     	mov	w3, #0x0                ; =0
100b50c10:     	bl	0x100b5099c <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb>
100b50c14:     	cmp	x0, #0x0
100b50c18:     	cset	w0, ne
100b50c1c:     	b	0x100b50be8 <__Z30WM_ipad_knife_hud_scope_activePK8bContext+0x64>
