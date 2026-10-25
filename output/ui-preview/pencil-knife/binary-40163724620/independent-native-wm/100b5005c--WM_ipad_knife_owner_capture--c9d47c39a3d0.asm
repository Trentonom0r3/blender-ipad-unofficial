
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b5005c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>:
100b5005c:     	sub	sp, sp, #0x1d0
100b50060:     	stp	x26, x25, [sp, #0x180]
100b50064:     	stp	x24, x23, [sp, #0x190]
100b50068:     	stp	x22, x21, [sp, #0x1a0]
100b5006c:     	stp	x20, x19, [sp, #0x1b0]
100b50070:     	stp	x29, x30, [sp, #0x1c0]
100b50074:     	add	x29, sp, #0x1c0
100b50078:     	mov	w23, #0x0               ; =0
100b5007c:     	str	xzr, [x3, #0xb0]
100b50080:     	movi.16b	v0, #0x0
100b50084:     	stp	q0, q0, [x3, #0x90]
100b50088:     	stp	q0, q0, [x3, #0x70]
100b5008c:     	stp	q0, q0, [x3, #0x50]
100b50090:     	stp	q0, q0, [x3, #0x30]
100b50094:     	stp	q0, q0, [x3, #0x10]
100b50098:     	str	q0, [x3]
100b5009c:     	cbz	x1, 0x100b5011c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b500a0:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b500a4:     	add	x8, x8, #0x28
100b500a8:     	ldr	x8, [x8]
100b500ac:     	cbz	x8, 0x100b5011c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b500b0:     	ldr	x23, [x8, #0x678]
100b500b4:     	cbz	x23, 0x100b5011c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b500b8:     	mov	x19, x2
100b500bc:     	mov	x20, x1
100b500c0:     	mov	x21, x0
100b500c4:     	mov	x22, x3
100b500c8:     	mov	x25, #0x0               ; =0
100b500cc:     	b	0x100b500e0 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x84>
100b500d0:     	mov	x24, x25
100b500d4:     	ldr	x23, [x23]
100b500d8:     	mov	x25, x24
100b500dc:     	cbz	x23, 0x100b50100 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xa4>
100b500e0:     	add	x0, x23, #0x1a0
100b500e4:     	mov	x1, x20
100b500e8:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b500ec:     	cmn	w0, #0x1
100b500f0:     	b.eq	0x100b500d0 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x74>
100b500f4:     	mov	x24, x23
100b500f8:     	cbz	x25, 0x100b500d4 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x78>
100b500fc:     	b	0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50100:     	cbz	x21, 0x100b5011c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b50104:     	cbz	x24, 0x100b5011c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b50108:     	mov	x0, x21
100b5010c:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b50110:     	cmp	x0, x24
100b50114:     	b.eq	0x100b5013c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xe0>
100b50118:     	mov	w23, #0x0               ; =0
100b5011c:     	and	w0, w23, #0x1
100b50120:     	ldp	x29, x30, [sp, #0x1c0]
100b50124:     	ldp	x20, x19, [sp, #0x1b0]
100b50128:     	ldp	x22, x21, [sp, #0x1a0]
100b5012c:     	ldp	x24, x23, [sp, #0x190]
100b50130:     	ldp	x26, x25, [sp, #0x180]
100b50134:     	add	sp, sp, #0x1d0
100b50138:     	ret
100b5013c:     	mov	x0, x21
100b50140:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b50144:     	mov	w23, #0x0               ; =0
100b50148:     	cbz	x19, 0x100b5011c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b5014c:     	cmp	x0, x20
100b50150:     	b.ne	0x100b5011c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b50154:     	ldr	x21, [x20, #0x118]
100b50158:     	cbz	x21, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b5015c:     	mov	w23, #0x0               ; =0
100b50160:     	b	0x100b5016c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b50164:     	ldr	x21, [x21]
100b50168:     	cbz	x21, 0x100b5011c <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b5016c:     	ldrb	w8, [x21, #0x14]
100b50170:     	tbnz	w8, #0x7, 0x100b50164 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x108>
100b50174:     	ldr	w8, [x21, #0x10]
100b50178:     	cmp	w8, #0x3
100b5017c:     	b.eq	0x100b501d8 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x17c>
100b50180:     	cmp	w8, #0x2
100b50184:     	b.ne	0x100b50164 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x108>
100b50188:     	ldr	x8, [x21, #0x38]
100b5018c:     	cmp	x8, x19
100b50190:     	b.ne	0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50194:     	ldr	x8, [x21, #0x48]
100b50198:     	cbnz	x8, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b5019c:     	ldr	x1, [x21, #0x40]
100b501a0:     	cbz	x1, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b501a4:     	add	x0, x19, #0x78
100b501a8:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b501ac:     	cmn	w0, #0x1
100b501b0:     	b.eq	0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b501b4:     	ldr	x2, [x21, #0x40]
100b501b8:     	ldrh	w8, [x2, #0xc0]
100b501bc:     	cmp	w8, #0x8
100b501c0:     	b.ne	0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b501c4:     	mov	x0, x21
100b501c8:     	mov	x1, x19
100b501cc:     	bl	0x101f344e8 <__Z28UI_ipad_knife_hud_ui_handlerPK14wmEventHandlerPK7ScrAreaPK7ARegion>
100b501d0:     	tbnz	w0, #0x0, 0x100b50164 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x108>
100b501d4:     	b	0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b501d8:     	str	xzr, [sp, #0xb0]
100b501dc:     	movi.16b	v0, #0x0
100b501e0:     	stp	q0, q0, [sp, #0x90]
100b501e4:     	stp	q0, q0, [sp, #0x70]
100b501e8:     	stp	q0, q0, [sp, #0x50]
100b501ec:     	stp	q0, q0, [sp, #0x30]
100b501f0:     	stp	q0, q0, [sp, #0x10]
100b501f4:     	str	q0, [sp]
100b501f8:     	add	x8, x21, #0x178
100b501fc:     	ldp	q0, q1, [x8, #0x80]
100b50200:     	stp	q0, q1, [sp, #0x140]
100b50204:     	ldr	q0, [x8, #0xa0]
100b50208:     	str	q0, [sp, #0x160]
100b5020c:     	ldr	x9, [x21, #0x228]
100b50210:     	str	x9, [sp, #0x170]
100b50214:     	ldp	q0, q1, [x8, #0x40]
100b50218:     	stp	q0, q1, [sp, #0x100]
100b5021c:     	ldp	q0, q1, [x8, #0x60]
100b50220:     	stp	q0, q1, [sp, #0x120]
100b50224:     	ldp	q0, q1, [x8]
100b50228:     	stp	q0, q1, [sp, #0xc0]
100b5022c:     	ldp	q0, q1, [x8, #0x20]
100b50230:     	stp	q0, q1, [sp, #0xe0]
100b50234:     	ldr	x8, [sp, #0xc0]
100b50238:     	cbz	x8, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b5023c:     	ldr	x8, [sp, #0xd0]
100b50240:     	cbz	x8, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50244:     	ldr	x8, [sp, #0xf0]
100b50248:     	cbz	x8, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b5024c:     	ldr	x8, [sp, #0x148]
100b50250:     	cbz	x8, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50254:     	ldr	x8, [sp, #0x158]
100b50258:     	cbz	x8, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b5025c:     	ldr	x8, [sp, #0xf8]
100b50260:     	cmp	x8, x19
100b50264:     	b.ne	0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50268:     	ldr	x3, [sp, #0x100]
100b5026c:     	mov	x5, sp
100b50270:     	mov	x0, x20
100b50274:     	mov	x1, x21
100b50278:     	mov	x2, x19
100b5027c:     	mov	w4, #0x0                ; =0
100b50280:     	bl	0x100b502e8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner>
100b50284:     	cbz	w0, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50288:     	mov	x0, sp
100b5028c:     	add	x1, sp, #0xc0
100b50290:     	mov	w2, #0xb8               ; =184
100b50294:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
100b50298:     	cmp	w0, #0x0
100b5029c:     	cset	w8, ne
100b502a0:     	orr	w8, w8, w23
100b502a4:     	tbnz	w8, #0x0, 0x100b50118 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b502a8:     	ldp	q0, q1, [sp, #0x80]
100b502ac:     	stp	q0, q1, [x22, #0x80]
100b502b0:     	ldr	q0, [sp, #0xa0]
100b502b4:     	str	q0, [x22, #0xa0]
100b502b8:     	ldr	x9, [sp, #0xb0]
100b502bc:     	str	x9, [x22, #0xb0]
100b502c0:     	ldp	q0, q1, [sp, #0x40]
100b502c4:     	stp	q0, q1, [x22, #0x40]
100b502c8:     	ldp	q0, q1, [sp, #0x60]
100b502cc:     	stp	q0, q1, [x22, #0x60]
100b502d0:     	ldp	q0, q1, [sp]
100b502d4:     	stp	q0, q1, [x22]
100b502d8:     	ldp	q0, q1, [sp, #0x20]
100b502dc:     	mov	w23, #0x1               ; =1
100b502e0:     	stp	q0, q1, [x22, #0x20]
100b502e4:     	b	0x100b50164 <__Z27WM_ipad_knife_owner_capturePK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x108>
