
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010b1050 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4>:
1010b1050:     	sub	sp, sp, #0x90
1010b1054:     	stp	d9, d8, [sp, #0x30]
1010b1058:     	stp	x26, x25, [sp, #0x40]
1010b105c:     	stp	x24, x23, [sp, #0x50]
1010b1060:     	stp	x22, x21, [sp, #0x60]
1010b1064:     	stp	x20, x19, [sp, #0x70]
1010b1068:     	stp	x29, x30, [sp, #0x80]
1010b106c:     	add	x29, sp, #0x80
1010b1070:     	fmov	s8, s1
1010b1074:     	str	q0, [sp]
1010b1078:     	mov	x21, x0
1010b107c:     	ldr	x20, [x0, #0x20]
1010b1080:     	ldr	x0, [x20, #0x18]
1010b1084:     	bl	0x1010b3fa0 <__ZNK19GHOST_WindowManager15getActiveWindowEv>
1010b1088:     	mov	x19, x0
1010b108c:     	ldr	x0, [x20, #0x18]
1010b1090:     	mov	x1, x19
1010b1094:     	bl	0x1010b3e5c <__ZNK19GHOST_WindowManager14getWindowFoundEPK13GHOST_IWindow>
1010b1098:     	cbz	w0, 0x1010b13ac <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x35c>
1010b109c:     	ldr	x0, [x19, #0xa8]
1010b10a0:     	bl	0x104b7c360 <_objc_msgSend$window>
1010b10a4:     	cbz	x0, 0x1010b13ac <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x35c>
1010b10a8:     	mov	x20, x0
1010b10ac:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010b10b0:     	ldrsw	x8, [x8, #0xf84]
1010b10b4:     	ldr	x19, [x0, x8]
1010b10b8:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010b10bc:     	ldrsw	x8, [x8, #0x2c]
1010b10c0:     	ldrb	w9, [x0, x8]
1010b10c4:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010b10c8:     	ldrsw	x8, [x8, #0x30]
1010b10cc:     	ldrb	w8, [x0, x8]
1010b10d0:     	cmp	w9, #0x1
1010b10d4:     	b.eq	0x1010b10f4 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0xa4>
1010b10d8:     	tbnz	w8, #0x0, 0x1010b10f4 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0xa4>
1010b10dc:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010b10e0:     	ldrsw	x8, [x8, #0x34]
1010b10e4:     	ldrb	w8, [x20, x8]
1010b10e8:     	cmp	w8, #0x1
1010b10ec:     	b.ne	0x1010b13ac <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x35c>
1010b10f0:     	mov	w8, #0x0                ; =0
1010b10f4:     	adrp	x9, 0x106627000 <_zlibVersion+0x106627000>
1010b10f8:     	ldr	w9, [x9, #0xfb0]
1010b10fc:     	tbz	w8, #0x0, 0x1010b1220 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x1d0>
1010b1100:     	ldrb	w8, [x20, w9, sxtw]
1010b1104:     	tbnz	w8, #0x0, 0x1010b13ac <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x35c>
1010b1108:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010b110c:     	ldrsw	x22, [x8, #0xfc4]
1010b1110:     	ldrb	w8, [x20, x22]
1010b1114:     	tbnz	w8, #0x0, 0x1010b1228 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x1d8>
1010b1118:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010b111c:     	ldr	x0, [x8, #0xbe0]
1010b1120:     	bl	0x104b78fc0 <_objc_msgSend$mainScreen>
1010b1124:     	bl	0x104b79ca0 <_objc_msgSend$scale>
1010b1128:     	fmov	d9, d0
1010b112c:     	ldrb	w25, [x20, x22]
1010b1130:     	ldr	x22, [x21, #0x20]
1010b1134:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010b1138:     	add	x8, x8, #0x750
1010b113c:     	ldr	x8, [x8]
1010b1140:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010b1144:     	add	x2, x2, #0xc2a
1010b1148:     	mov	w24, #0x1               ; =1
1010b114c:     	mov	w0, #0x48               ; =72
1010b1150:     	mov	w1, #0x10               ; =16
1010b1154:     	mov	w3, #0x1                ; =1
1010b1158:     	blr	x8
1010b115c:     	mov	x23, x0
1010b1160:     	ldr	x0, [x21, #0x20]
1010b1164:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010b1168:     	fcvt	s0, d9
1010b116c:     	cmp	w25, #0x0
1010b1170:     	mov	w8, #0x147b             ; =5243
1010b1174:     	movk	w8, #0x3e2e, lsl #16
1010b1178:     	fmov	s1, w8
1010b117c:     	fmov	s2, #1.00000000
1010b1180:     	fcsel	s1, s1, s2, ne
1010b1184:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010b1188:     	ldrsw	x8, [x8, #0x48]
1010b118c:     	ldr	d2, [x20, x8]
1010b1190:     	fcvtzs	w8, d2
1010b1194:     	adrp	x9, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010b1198:     	ldrsw	x9, [x9, #0x4c]
1010b119c:     	ldr	d2, [x20, x9]
1010b11a0:     	fcvtzs	w9, d2
1010b11a4:     	fneg	s2, s8
1010b11a8:     	mov	w10, #0x5               ; =5
1010b11ac:     	str	w10, [x23, #0x8]
1010b11b0:     	stp	x0, x19, [x23, #0x10]
1010b11b4:     	adrp	x10, 0x1063ff000 <__ZTV12GHOST_Window+0x88>
1010b11b8:     	add	x10, x10, #0x438
1010b11bc:     	add	x10, x10, #0x10
1010b11c0:     	str	x10, [x23]
1010b11c4:     	mov	x10, x23
1010b11c8:     	str	w24, [x10, #0x28]!
1010b11cc:     	stp	w8, w9, [x23, #0x2c]
1010b11d0:     	ldr	q3, [sp]
1010b11d4:     	mov.s	v3[1], v2[0]
1010b11d8:     	fmul.2s	v0, v3, v0[0]
1010b11dc:     	fmul.2s	v0, v0, v1[0]
1010b11e0:     	fcvtzs.2s	v0, v0
1010b11e4:     	stur	d0, [x23, #0x34]
1010b11e8:     	strh	w24, [x23, #0x3c]
1010b11ec:     	mov	w8, #0x2                ; =2
1010b11f0:     	str	w8, [x23, #0x40]
1010b11f4:     	str	x10, [x23, #0x20]
1010b11f8:     	mov	x0, x22
1010b11fc:     	mov	x1, x23
1010b1200:     	ldp	x29, x30, [sp, #0x80]
1010b1204:     	ldp	x20, x19, [sp, #0x70]
1010b1208:     	ldp	x22, x21, [sp, #0x60]
1010b120c:     	ldp	x24, x23, [sp, #0x50]
1010b1210:     	ldp	x26, x25, [sp, #0x40]
1010b1214:     	ldp	d9, d8, [sp, #0x30]
1010b1218:     	add	sp, sp, #0x90
1010b121c:     	b	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010b1220:     	ldrb	w8, [x20, w9, sxtw]
1010b1224:     	tbnz	w8, #0x0, 0x1010b13ac <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x35c>
1010b1228:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010b122c:     	ldr	x0, [x8, #0xbe0]
1010b1230:     	bl	0x104b78fc0 <_objc_msgSend$mainScreen>
1010b1234:     	bl	0x104b79ca0 <_objc_msgSend$scale>
1010b1238:     	fcvt	s0, d0
1010b123c:     	ldr	q1, [sp]
1010b1240:     	fmul	s1, s0, s1
1010b1244:     	fcvt	d1, s1
1010b1248:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010b124c:     	ldrsw	x24, [x8, #0x48]
1010b1250:     	ldr	d2, [x20, x24]
1010b1254:     	fadd	d1, d2, d1
1010b1258:     	str	d1, [x20, x24]
1010b125c:     	fmul	s0, s0, s8
1010b1260:     	adrp	x8, 0x106628000 <_OBJC_IVAR_$_GHOSTUIWindow.edge_swipe_left>
1010b1264:     	ldrsw	x25, [x8, #0x4c]
1010b1268:     	ldr	d1, [x20, x25]
1010b126c:     	fcvt	d0, s0
1010b1270:     	fsub	d0, d1, d0
1010b1274:     	str	d0, [x20, x25]
1010b1278:     	adrp	x8, 0x1063fe000 <__ZTV16GHOST_WindowNULL+0x38>
1010b127c:     	add	x8, x8, #0x1e0
1010b1280:     	add	x8, x8, #0x10
1010b1284:     	stp	xzr, xzr, [sp, #0x20]
1010b1288:     	str	x8, [sp, #0x18]
1010b128c:     	ldr	x8, [x19]
1010b1290:     	ldr	x8, [x8, #0x78]
1010b1294:     	add	x1, sp, #0x18
1010b1298:     	mov	x0, x19
1010b129c:     	blr	x8
1010b12a0:     	ldp	w9, w8, [sp, #0x28]
1010b12a4:     	ldp	w11, w10, [sp, #0x20]
1010b12a8:     	sub	w9, w9, w11
1010b12ac:     	ldr	d0, [x20, x24]
1010b12b0:     	fcmp	d0, #0.0
1010b12b4:     	b.pl	0x1010b12c0 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x270>
1010b12b8:     	str	xzr, [x20, x24]
1010b12bc:     	fmov	d0, xzr
1010b12c0:     	sub	w8, w8, w10
1010b12c4:     	scvtf	s2, w9
1010b12c8:     	ldr	d1, [x20, x25]
1010b12cc:     	fcmp	d1, #0.0
1010b12d0:     	b.pl	0x1010b12e0 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x290>
1010b12d4:     	str	xzr, [x20, x25]
1010b12d8:     	ldr	d0, [x20, x24]
1010b12dc:     	fmov	d1, xzr
1010b12e0:     	scvtf	s3, w8
1010b12e4:     	fcvt	d2, s2
1010b12e8:     	fcmp	d0, d2
1010b12ec:     	b.le	0x1010b12f8 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x2a8>
1010b12f0:     	str	d2, [x20, x24]
1010b12f4:     	ldr	d1, [x20, x25]
1010b12f8:     	fcvt	d0, s3
1010b12fc:     	fcmp	d1, d0
1010b1300:     	b.le	0x1010b1308 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x2b8>
1010b1304:     	str	d0, [x20, x25]
1010b1308:     	ldr	x22, [x21, #0x20]
1010b130c:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010b1310:     	add	x8, x8, #0x750
1010b1314:     	ldr	x8, [x8]
1010b1318:     	adrp	x2, 0x104c16000 <__ZL3hex+0x465cd>
1010b131c:     	add	x2, x2, #0xc2a
1010b1320:     	mov	w0, #0x88               ; =136
1010b1324:     	mov	w1, #0x10               ; =16
1010b1328:     	mov	w3, #0x1                ; =1
1010b132c:     	blr	x8
1010b1330:     	mov	x23, x0
1010b1334:     	ldr	x0, [x21, #0x20]
1010b1338:     	bl	0x101096204 <_GHOST_GetMilliSeconds>
1010b133c:     	ldr	d0, [x20, x24]
1010b1340:     	fcvtzs	w8, d0
1010b1344:     	ldr	d0, [x20, x25]
1010b1348:     	fcvtzs	w9, d0
1010b134c:     	mov	w10, #0x1               ; =1
1010b1350:     	str	w10, [x23, #0x8]
1010b1354:     	stp	x0, x19, [x23, #0x10]
1010b1358:     	adrp	x10, 0x1063fe000 <__ZTV16GHOST_WindowNULL+0x38>
1010b135c:     	add	x10, x10, #0xde8
1010b1360:     	add	x10, x10, #0x10
1010b1364:     	str	x10, [x23]
1010b1368:     	mov	x10, x23
1010b136c:     	str	w8, [x10, #0x28]!
1010b1370:     	adrp	x8, 0x10513c000 <__ZTSN3tbb6detail2d112start_reduceINS1_13blocked_rangeIxEENS1_18lambda_reduce_bodyIS4_N7blender4draw8AreaInfoEZNS6_9threading15parallel_reduceIS8_ZNS7_L18compute_area_ratioERKNS7_14MeshRenderDataENS6_11MutableSpanIfEEE3$_0ZNS7_L18compute_area_ratioESD_SF_E3$_1EET_NS6_10IndexRangeExRKSI_RKT0_RKT1_EUlRKS4_RKS8_E_SH_EEKNS1_16auto_partitionerEEE+0x40>
1010b1374:     	add	x8, x8, #0x544
1010b1378:     	str	w9, [x23, #0x2c]
1010b137c:     	ldr	q0, [x8]
1010b1380:     	str	q0, [x23, #0x30]
1010b1384:     	strb	wzr, [x23, #0x40]
1010b1388:     	stp	xzr, xzr, [x23, #0x48]
1010b138c:     	strb	wzr, [x23, #0x58]
1010b1390:     	movi.16b	v0, #0x0
1010b1394:     	stp	q0, q0, [x23, #0x60]
1010b1398:     	str	xzr, [x23, #0x80]
1010b139c:     	str	x10, [x23, #0x20]
1010b13a0:     	mov	x0, x22
1010b13a4:     	mov	x1, x23
1010b13a8:     	bl	0x10109a124 <__ZN12GHOST_System9pushEventEPK12GHOST_IEvent>
1010b13ac:     	ldp	x29, x30, [sp, #0x80]
1010b13b0:     	ldp	x20, x19, [sp, #0x70]
1010b13b4:     	ldp	x22, x21, [sp, #0x60]
1010b13b8:     	ldp	x24, x23, [sp, #0x50]
1010b13bc:     	ldp	x26, x25, [sp, #0x40]
1010b13c0:     	ldp	d9, d8, [sp, #0x30]
1010b13c4:     	add	sp, sp, #0x90
1010b13c8:     	ret
1010b13cc:     	mov	x19, x0
1010b13d0:     	cbz	x23, 0x1010b1424 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x3d4>
1010b13d4:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010b13d8:     	add	x8, x8, #0x710
1010b13dc:     	ldr	x8, [x8]
1010b13e0:     	mov	x0, x23
1010b13e4:     	mov	w1, #0x1                ; =1
1010b13e8:     	blr	x8
1010b13ec:     	b	0x1010b1424 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x3d4>
1010b13f0:     	bl	0x1000144bc <___clang_call_terminate>
1010b13f4:     	mov	x19, x0
1010b13f8:     	cbz	x23, 0x1010b1424 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x3d4>
1010b13fc:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
1010b1400:     	add	x8, x8, #0x710
1010b1404:     	ldr	x8, [x8]
1010b1408:     	mov	x0, x23
1010b140c:     	mov	w1, #0x1                ; =1
1010b1410:     	blr	x8
1010b1414:     	b	0x1010b1424 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x3d4>
1010b1418:     	bl	0x1000144bc <___clang_call_terminate>
1010b141c:     	b	0x1010b1420 <___37-[GHOSTUIWindow externalMouseChange:]_block_invoke_4+0x3d0>
1010b1420:     	mov	x19, x0
1010b1424:     	mov	x0, x19
1010b1428:     	bl	0x104b72c1c <_zlibVersion+0x104b72c1c>
