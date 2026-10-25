
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010163ee4c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea>:
10163ee4c:     	stp	x22, x21, [sp, #-0x30]!
10163ee50:     	stp	x20, x19, [sp, #0x10]
10163ee54:     	stp	x29, x30, [sp, #0x20]
10163ee58:     	add	x29, sp, #0x20
10163ee5c:     	mov	x19, x2
10163ee60:     	mov	x20, x1
10163ee64:     	mov	x21, x0
10163ee68:     	str	xzr, [x2]
10163ee6c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
10163ee70:     	mov	x22, x0
10163ee74:     	ldr	w8, [x20]
10163ee78:     	cmp	w8, #0x1
10163ee7c:     	b.ne	0x10163ee98 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x4c>
10163ee80:     	adrp	x8, 0x106d88000 <_build_commit_date>
10163ee84:     	add	x8, x8, #0x28
10163ee88:     	ldr	x8, [x8]
10163ee8c:     	mov	x0, #0x0                ; =0
10163ee90:     	cbnz	x22, 0x10163eeac <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x60>
10163ee94:     	b	0x10163ef0c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xc0>
10163ee98:     	mov	x0, x21
10163ee9c:     	bl	0x1000b4c78 <__Z13CTX_data_mainPK8bContext>
10163eea0:     	mov	x8, x0
10163eea4:     	mov	x0, #0x0                ; =0
10163eea8:     	cbz	x22, 0x10163ef0c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xc0>
10163eeac:     	ldr	x9, [x20, #0xc0]
10163eeb0:     	cmp	x9, x8
10163eeb4:     	b.ne	0x10163ef0c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xc0>
10163eeb8:     	ldr	w8, [x22, #0x144]
10163eebc:     	ldr	x9, [x20, #0x120]
10163eec0:     	cmp	x9, x8
10163eec4:     	b.ne	0x10163ef08 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xbc>
10163eec8:     	ldr	x22, [x22, #0x1a0]
10163eecc:     	cbz	x22, 0x10163ef08 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xbc>
10163eed0:     	ldr	x8, [x20, #0xc8]
10163eed4:     	ldr	x9, [x20, #0x118]
10163eed8:     	b	0x10163eee4 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x98>
10163eedc:     	ldr	x22, [x22]
10163eee0:     	cbz	x22, 0x10163ef08 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xbc>
10163eee4:     	cmp	x8, x22
10163eee8:     	b.ne	0x10163eedc <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x90>
10163eeec:     	ldrsw	x10, [x22, #0xc0]
10163eef0:     	cmp	x9, x10
10163eef4:     	b.ne	0x10163eedc <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x90>
10163eef8:     	mov	x0, x21
10163eefc:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
10163ef00:     	cmp	x0, x22
10163ef04:     	b.eq	0x10163ef1c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xd0>
10163ef08:     	mov	x0, #0x0                ; =0
10163ef0c:     	ldp	x29, x30, [sp, #0x20]
10163ef10:     	ldp	x20, x19, [sp, #0x10]
10163ef14:     	ldp	x22, x21, [sp], #0x30
10163ef18:     	ret
10163ef1c:     	mov	x0, x22
10163ef20:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
10163ef24:     	mov	x8, x0
10163ef28:     	mov	x0, #0x0                ; =0
10163ef2c:     	cbz	x8, 0x10163ef0c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xc0>
10163ef30:     	ldr	x9, [x20, #0xd0]
10163ef34:     	cmp	x9, x8
10163ef38:     	b.ne	0x10163ef0c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xc0>
10163ef3c:     	ldr	w9, [x8, #0x144]
10163ef40:     	ldr	x10, [x20, #0xe8]
10163ef44:     	cmp	x10, x9
10163ef48:     	b.ne	0x10163ef08 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xbc>
10163ef4c:     	add	x8, x8, #0x1c0
10163ef50:     	ldr	x9, [x20, #0xd8]
10163ef54:     	ldr	x8, [x8]
10163ef58:     	cbz	x8, 0x10163ef08 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xbc>
10163ef5c:     	cmp	x9, x8
10163ef60:     	b.ne	0x10163ef54 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x108>
10163ef64:     	ldr	x9, [x8, #0x78]
10163ef68:     	cbz	x9, 0x10163ef08 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xbc>
10163ef6c:     	ldp	x10, x11, [x20, #0x168]
10163ef70:     	b	0x10163ef80 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x134>
10163ef74:     	mov	x0, #0x0                ; =0
10163ef78:     	ldr	x9, [x9]
10163ef7c:     	cbz	x9, 0x10163ef0c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xc0>
10163ef80:     	cmp	x10, x9
10163ef84:     	b.ne	0x10163ef74 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x128>
10163ef88:     	ldrh	w12, [x9, #0xc0]
10163ef8c:     	cmp	w12, #0x8
10163ef90:     	b.ne	0x10163ef74 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x128>
10163ef94:     	ldr	x12, [x9, #0x128]
10163ef98:     	ldr	x12, [x12, #0xb0]
10163ef9c:     	cmp	x12, x11
10163efa0:     	b.ne	0x10163ef74 <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0x128>
10163efa4:     	str	x8, [x19]
10163efa8:     	mov	x0, x9
10163efac:     	b	0x10163ef0c <__ZN12_GLOBAL__N_122ipad_hud_retire_regionEP8bContextRKNS_12IPadHUDOwnerERP7ScrArea+0xc0>
