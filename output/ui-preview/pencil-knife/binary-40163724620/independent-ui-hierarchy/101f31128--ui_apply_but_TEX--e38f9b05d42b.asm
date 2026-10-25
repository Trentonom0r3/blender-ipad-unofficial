
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f31128 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData>:
101f31128:     	stp	x24, x23, [sp, #-0x40]!
101f3112c:     	stp	x22, x21, [sp, #0x10]
101f31130:     	stp	x20, x19, [sp, #0x20]
101f31134:     	stp	x29, x30, [sp, #0x30]
101f31138:     	add	x29, sp, #0x30
101f3113c:     	mov	x19, x2
101f31140:     	ldr	x2, [x2, #0x40]
101f31144:     	cbz	x2, 0x101f31234 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x10c>
101f31148:     	mov	x20, x1
101f3114c:     	mov	x21, x0
101f31150:     	bl	0x101f102bc <__Z17ui_but_string_setP8bContextP5uiButPKc>
101f31154:     	mov	x0, x20
101f31158:     	bl	0x101f127c0 <__Z20ui_but_update_editedP5uiBut>
101f3115c:     	ldr	x0, [x19, #0x50]
101f31160:     	cbz	x0, 0x101f3116c <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x44>
101f31164:     	ldrb	w8, [x20, #0x1b]
101f31168:     	tbnz	w8, #0x5, 0x101f311bc <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x94>
101f3116c:     	ldr	x8, [x20, #0xa0]
101f31170:     	cbnz	x8, 0x101f311b0 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x88>
101f31174:     	ldr	x8, [x20, #0xd0]
101f31178:     	cbnz	x8, 0x101f311b0 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x88>
101f3117c:     	ldr	x8, [x20, #0xd8]
101f31180:     	cbnz	x8, 0x101f311b0 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x88>
101f31184:     	ldr	x8, [x20, #0x110]
101f31188:     	cbnz	x8, 0x101f311b0 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x88>
101f3118c:     	ldr	x8, [x20, #0x140]
101f31190:     	cbnz	x8, 0x101f311b0 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x88>
101f31194:     	ldr	x8, [x20, #0x3b0]
101f31198:     	cbnz	x8, 0x101f311b0 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x88>
101f3119c:     	ldr	x8, [x20, #0x258]
101f311a0:     	cbnz	x8, 0x101f311b0 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x88>
101f311a4:     	ldr	x8, [x20, #0x420]
101f311a8:     	ldr	x9, [x8, #0x2d8]
101f311ac:     	cbz	x9, 0x101f31248 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x120>
101f311b0:     	str	x0, [x20, #0x120]
101f311b4:     	str	xzr, [x19, #0x50]
101f311b8:     	b	0x101f311c4 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x9c>
101f311bc:     	bl	0x100819e6c <__Z10BLI_strdupPKc>
101f311c0:     	str	x0, [x20, #0x120]
101f311c4:     	ldr	x23, [x20, #0xb0]
101f311c8:     	cbnz	x23, 0x101f31214 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0xec>
101f311cc:     	ldrb	w8, [x20, #0x21]
101f311d0:     	cmp	w8, #0x21
101f311d4:     	b.ne	0x101f31214 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0xec>
101f311d8:     	ldr	x8, [x20, #0x440]
101f311dc:     	str	x8, [x20, #0xb0]
101f311e0:     	adrp	x8, 0x106d88000 <_build_commit_date>
101f311e4:     	add	x8, x8, #0xe08
101f311e8:     	ldrb	w8, [x8, #0x8]
101f311ec:     	tbnz	w8, #0x2, 0x101f31214 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0xec>
101f311f0:     	ldr	x22, [x20, #0x448]
101f311f4:     	cbz	x22, 0x101f31208 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0xe0>
101f311f8:     	mov	x0, x22
101f311fc:     	bl	0x104b72f44 <_zlibVersion+0x104b72f44>
101f31200:     	mov	x1, x0
101f31204:     	b	0x101f3120c <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0xe4>
101f31208:     	mov	x1, #0x0                ; =0
101f3120c:     	mov	x0, x22
101f31210:     	bl	0x101f73a28 <__ZN7blender2ui13string_search17add_recent_searchENS_9StringRefE>
101f31214:     	mov	x0, x21
101f31218:     	mov	x1, x20
101f3121c:     	bl	0x101f37bcc <__ZL17ui_apply_but_funcP8bContextP5uiBut>
101f31220:     	str	x23, [x20, #0xb0]
101f31224:     	ldrsh	w8, [x20, #0x26]
101f31228:     	str	w8, [x19, #0x28]
101f3122c:     	mov	w8, #0x1                ; =1
101f31230:     	strb	w8, [x19, #0x2e]
101f31234:     	ldp	x29, x30, [sp, #0x30]
101f31238:     	ldp	x20, x19, [sp, #0x20]
101f3123c:     	ldp	x22, x21, [sp, #0x10]
101f31240:     	ldp	x24, x23, [sp], #0x40
101f31244:     	ret
101f31248:     	ldr	x8, [x8, #0x3a8]
101f3124c:     	cbz	x8, 0x101f311c4 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x9c>
101f31250:     	ldr	x8, [x8, #0x270]
101f31254:     	cbnz	x8, 0x101f311b0 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x88>
101f31258:     	b	0x101f311c4 <__ZL16ui_apply_but_TEXP8bContextP5uiButP18uiHandleButtonData+0x9c>
