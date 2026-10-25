
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5099c <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb>:
100b5099c:     	ldr	x8, [x2]
100b509a0:     	ldr	x9, [x2, #0x10]
100b509a4:     	ldr	x10, [x2, #0x30]
100b509a8:     	ldr	x11, [x2, #0x88]
100b509ac:     	ldr	x12, [x2, #0x98]
100b509b0:     	cmp	x8, #0x0
100b509b4:     	ccmp	x9, #0x0, #0x4, ne
100b509b8:     	ccmp	x10, #0x0, #0x4, ne
100b509bc:     	ccmp	x11, #0x0, #0x4, ne
100b509c0:     	ccmp	x12, #0x0, #0x4, ne
100b509c4:     	b.ne	0x100b509d0 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x34>
100b509c8:     	mov	x0, #0x0                ; =0
100b509cc:     	ret
100b509d0:     	sub	sp, sp, #0x120
100b509d4:     	stp	x28, x27, [sp, #0xc0]
100b509d8:     	stp	x26, x25, [sp, #0xd0]
100b509dc:     	stp	x24, x23, [sp, #0xe0]
100b509e0:     	stp	x22, x21, [sp, #0xf0]
100b509e4:     	stp	x20, x19, [sp, #0x100]
100b509e8:     	stp	x29, x30, [sp, #0x110]
100b509ec:     	add	x29, sp, #0x110
100b509f0:     	mov	x19, x1
100b509f4:     	mov	x21, x0
100b509f8:     	mov	x0, #0x0                ; =0
100b509fc:     	cbz	x1, 0x100b50a88 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xec>
100b50a00:     	adrp	x24, 0x106d88000 <_build_commit_date>
100b50a04:     	add	x24, x24, #0x28
100b50a08:     	ldr	x8, [x24]
100b50a0c:     	cbz	x8, 0x100b50a88 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xec>
100b50a10:     	ldr	x22, [x8, #0x678]
100b50a14:     	cbz	x22, 0x100b50a84 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xe8>
100b50a18:     	mov	x20, x2
100b50a1c:     	mov	x23, x3
100b50a20:     	mov	x26, #0x0               ; =0
100b50a24:     	b	0x100b50a38 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x9c>
100b50a28:     	mov	x25, x26
100b50a2c:     	ldr	x22, [x22]
100b50a30:     	mov	x26, x25
100b50a34:     	cbz	x22, 0x100b50a58 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xbc>
100b50a38:     	add	x0, x22, #0x1a0
100b50a3c:     	mov	x1, x19
100b50a40:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b50a44:     	cmn	w0, #0x1
100b50a48:     	b.eq	0x100b50a28 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x8c>
100b50a4c:     	mov	x25, x22
100b50a50:     	cbz	x26, 0x100b50a2c <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x90>
100b50a54:     	b	0x100b50a84 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xe8>
100b50a58:     	mov	x0, #0x0                ; =0
100b50a5c:     	cbz	x21, 0x100b50a88 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xec>
100b50a60:     	cbz	x25, 0x100b50a88 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xec>
100b50a64:     	mov	x0, x21
100b50a68:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b50a6c:     	cmp	x0, x25
100b50a70:     	b.ne	0x100b50a84 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xe8>
100b50a74:     	mov	x0, x21
100b50a78:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b50a7c:     	cmp	x0, x19
100b50a80:     	b.eq	0x100b50aa8 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x10c>
100b50a84:     	mov	x0, #0x0                ; =0
100b50a88:     	ldp	x29, x30, [sp, #0x110]
100b50a8c:     	ldp	x20, x19, [sp, #0x100]
100b50a90:     	ldp	x22, x21, [sp, #0xf0]
100b50a94:     	ldp	x24, x23, [sp, #0xe0]
100b50a98:     	ldp	x26, x25, [sp, #0xd0]
100b50a9c:     	ldp	x28, x27, [sp, #0xc0]
100b50aa0:     	add	sp, sp, #0x120
100b50aa4:     	ret
100b50aa8:     	mov	x0, x19
100b50aac:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b50ab0:     	cbz	x0, 0x100b50a88 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xec>
100b50ab4:     	mov	x22, x0
100b50ab8:     	ldr	x8, [x24]
100b50abc:     	add	x0, x8, #0x598
100b50ac0:     	mov	x1, x22
100b50ac4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b50ac8:     	cmn	w0, #0x1
100b50acc:     	b.eq	0x100b50a84 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xe8>
100b50ad0:     	ldr	x22, [x22, #0x1c0]
100b50ad4:     	cbz	x22, 0x100b50a84 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xe8>
100b50ad8:     	mov	x9, x23
100b50adc:     	mov	x10, x20
100b50ae0:     	mov	x8, x21
100b50ae4:     	b	0x100b50af4 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x158>
100b50ae8:     	mov	x0, #0x0                ; =0
100b50aec:     	ldr	x22, [x22]
100b50af0:     	cbz	x22, 0x100b50a88 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xec>
100b50af4:     	ldr	x11, [x10, #0x38]
100b50af8:     	cmp	x11, x22
100b50afc:     	b.ne	0x100b50ae8 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x14c>
100b50b00:     	str	xzr, [sp, #0xb0]
100b50b04:     	movi.16b	v0, #0x0
100b50b08:     	stp	q0, q0, [sp, #0x90]
100b50b0c:     	stp	q0, q0, [sp, #0x70]
100b50b10:     	stp	q0, q0, [sp, #0x50]
100b50b14:     	stp	q0, q0, [sp, #0x30]
100b50b18:     	stp	q0, q0, [sp, #0x10]
100b50b1c:     	str	q0, [sp]
100b50b20:     	mov	x3, sp
100b50b24:     	mov	x0, x8
100b50b28:     	mov	x1, x19
100b50b2c:     	mov	x2, x22
100b50b30:     	cbz	w9, 0x100b50b40 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x1a4>
100b50b34:     	bl	0x100b50760 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
100b50b38:     	tbnz	w0, #0x0, 0x100b50b48 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x1ac>
100b50b3c:     	b	0x100b50a84 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xe8>
100b50b40:     	bl	0x100b5005c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>
100b50b44:     	cbz	w0, 0x100b50a84 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xe8>
100b50b48:     	mov	x0, sp
100b50b4c:     	mov	x1, x20
100b50b50:     	mov	w2, #0xb8               ; =184
100b50b54:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
100b50b58:     	cbnz	w0, 0x100b50a84 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xe8>
100b50b5c:     	add	x0, x22, #0x78
100b50b60:     	mov	x10, x20
100b50b64:     	ldr	x11, [x20, #0x40]
100b50b68:     	mov	x9, x23
100b50b6c:     	mov	x8, x21
100b50b70:     	ldr	x0, [x0]
100b50b74:     	cbz	x0, 0x100b50ae8 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x14c>
100b50b78:     	cmp	x11, x0
100b50b7c:     	b.ne	0x100b50b70 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0x1d4>
100b50b80:     	b	0x100b50a88 <__Z26WM_ipad_knife_owner_regionPK8bContextP8wmWindowRK16wmIPadKnifeOwnerb+0xec>
