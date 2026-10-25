
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b502e8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner>:
100b502e8:     	sub	sp, sp, #0xc0
100b502ec:     	stp	x28, x27, [sp, #0x60]
100b502f0:     	stp	x26, x25, [sp, #0x70]
100b502f4:     	stp	x24, x23, [sp, #0x80]
100b502f8:     	stp	x22, x21, [sp, #0x90]
100b502fc:     	stp	x20, x19, [sp, #0xa0]
100b50300:     	stp	x29, x30, [sp, #0xb0]
100b50304:     	add	x29, sp, #0xb0
100b50308:     	mov	x19, x0
100b5030c:     	mov	w0, #0x0                ; =0
100b50310:     	str	xzr, [x5, #0xb0]
100b50314:     	movi.16b	v0, #0x0
100b50318:     	stp	q0, q0, [x5, #0x90]
100b5031c:     	stp	q0, q0, [x5, #0x70]
100b50320:     	stp	q0, q0, [x5, #0x50]
100b50324:     	stp	q0, q0, [x5, #0x30]
100b50328:     	stp	q0, q0, [x5, #0x10]
100b5032c:     	str	q0, [x5]
100b50330:     	cbz	x19, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b50334:     	adrp	x24, 0x106d88000 <_build_commit_date>
100b50338:     	add	x24, x24, #0x28
100b5033c:     	ldr	x8, [x24]
100b50340:     	cbz	x8, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b50344:     	ldr	x20, [x8, #0x678]
100b50348:     	cbz	x20, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b5034c:     	mov	x22, x4
100b50350:     	mov	x27, x2
100b50354:     	mov	x26, x3
100b50358:     	mov	x25, x1
100b5035c:     	mov	x28, x5
100b50360:     	mov	x21, #0x0               ; =0
100b50364:     	b	0x100b50378 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x90>
100b50368:     	mov	x23, x21
100b5036c:     	ldr	x20, [x20]
100b50370:     	mov	x21, x23
100b50374:     	cbz	x20, 0x100b50398 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0xb0>
100b50378:     	add	x0, x20, #0x1a0
100b5037c:     	mov	x1, x19
100b50380:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b50384:     	cmn	w0, #0x1
100b50388:     	b.eq	0x100b50368 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x80>
100b5038c:     	mov	x23, x20
100b50390:     	cbz	x21, 0x100b5036c <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x84>
100b50394:     	b	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50398:     	cbz	x23, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b5039c:     	ldr	w8, [x23, #0x144]
100b503a0:     	cbz	w8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b503a4:     	mov	w0, #0x0                ; =0
100b503a8:     	cbz	x25, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b503ac:     	ldr	x8, [x19, #0x168]
100b503b0:     	cbz	x8, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b503b4:     	mov	x1, x25
100b503b8:     	add	x0, x19, #0x118
100b503bc:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b503c0:     	cmn	w0, #0x1
100b503c4:     	b.eq	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b503c8:     	ldr	w9, [x25, #0x10]
100b503cc:     	cmp	w9, #0x3
100b503d0:     	b.ne	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b503d4:     	mov	x8, x25
100b503d8:     	ldrb	w9, [x25, #0x14]
100b503dc:     	tbnz	w9, #0x7, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b503e0:     	ldrb	w9, [x8, #0x28]
100b503e4:     	tbnz	w9, #0x0, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b503e8:     	ldr	x9, [x8, #0x30]
100b503ec:     	cbz	x9, 0x100b5041c <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x134>
100b503f0:     	cmp	x9, x19
100b503f4:     	b.eq	0x100b5041c <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x134>
100b503f8:     	mov	w0, #0x0                ; =0
100b503fc:     	ldp	x29, x30, [sp, #0xb0]
100b50400:     	ldp	x20, x19, [sp, #0xa0]
100b50404:     	ldp	x22, x21, [sp, #0x90]
100b50408:     	ldp	x24, x23, [sp, #0x80]
100b5040c:     	ldp	x26, x25, [sp, #0x70]
100b50410:     	ldp	x28, x27, [sp, #0x60]
100b50414:     	add	sp, sp, #0xc0
100b50418:     	ret
100b5041c:     	ldr	x0, [x8, #0x20]
100b50420:     	cbz	x0, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b50424:     	ldr	x20, [x8, #0x200]
100b50428:     	tbnz	w22, #0x0, 0x100b50438 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x150>
100b5042c:     	mov	x1, x20
100b50430:     	bl	0x100b42eec <__Z34WM_operator_touch_lifetime_matchesPK10wmOperatory>
100b50434:     	cbz	w0, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b50438:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b5043c:     	add	x0, x0, #0xf17
100b50440:     	mov	w1, #0x0                ; =0
100b50444:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b50448:     	cbz	x0, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b5044c:     	ldr	x8, [x0, #0xe8]
100b50450:     	cbz	x8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50454:     	str	x0, [sp, #0x28]
100b50458:     	bl	0x101c33aa0 <__Z24ED_mesh_knife_modal_typePK14wmOperatorType>
100b5045c:     	cbz	w0, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b50460:     	ldr	x8, [x25, #0x20]
100b50464:     	ldr	x10, [x8, #0x58]
100b50468:     	ldr	x9, [sp, #0x28]
100b5046c:     	cmp	x10, x9
100b50470:     	b.ne	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50474:     	ldr	x8, [x8, #0x90]
100b50478:     	cbnz	x8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b5047c:     	mov	x0, x19
100b50480:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b50484:     	str	x0, [sp, #0x20]
100b50488:     	cbz	x0, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b5048c:     	ldr	x8, [x24]
100b50490:     	add	x0, x8, #0x598
100b50494:     	ldr	x1, [sp, #0x20]
100b50498:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b5049c:     	cmn	w0, #0x1
100b504a0:     	b.eq	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b504a4:     	ldr	x8, [sp, #0x20]
100b504a8:     	ldr	w8, [x8, #0x144]
100b504ac:     	cbz	w8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b504b0:     	ldr	x8, [sp, #0x20]
100b504b4:     	add	x21, x8, #0x1c0
100b504b8:     	ldr	x21, [x21]
100b504bc:     	cbz	x21, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b504c0:     	cmp	x21, x27
100b504c4:     	b.ne	0x100b504b8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x1d0>
100b504c8:     	ldrb	w8, [x21, #0x48]
100b504cc:     	cmp	w8, #0x1
100b504d0:     	b.ne	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b504d4:     	ldr	x8, [x25, #0x38]
100b504d8:     	cmp	x8, x21
100b504dc:     	b.ne	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b504e0:     	add	x8, x21, #0x78
100b504e4:     	str	x8, [sp, #0x18]
100b504e8:     	ldr	x8, [sp, #0x18]
100b504ec:     	ldr	x8, [x8]
100b504f0:     	str	x8, [sp, #0x18]
100b504f4:     	cbz	x8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b504f8:     	ldr	x8, [sp, #0x18]
100b504fc:     	cmp	x8, x26
100b50500:     	b.ne	0x100b504e8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x200>
100b50504:     	ldr	x8, [sp, #0x18]
100b50508:     	ldrh	w8, [x8, #0xc0]
100b5050c:     	cbnz	w8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50510:     	ldr	x8, [sp, #0x18]
100b50514:     	ldr	x8, [x8, #0x128]
100b50518:     	cbz	x8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b5051c:     	ldrh	w8, [x8, #0x2b0]
100b50520:     	cbz	w8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50524:     	ldr	x8, [sp, #0x18]
100b50528:     	ldr	x8, [x8, #0x120]
100b5052c:     	cbz	x8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50530:     	movi.16b	v0, #0x0
100b50534:     	stp	q0, q0, [sp, #0x40]
100b50538:     	str	q0, [sp, #0x30]
100b5053c:     	ldr	x0, [x25, #0x20]
100b50540:     	add	x1, sp, #0x30
100b50544:     	bl	0x101c34624 <__Z26ED_mesh_knife_modal_originPK10wmOperatorR20MeshKnifeModalOrigin>
100b50548:     	mov	x8, x0
100b5054c:     	mov	w0, #0x0                ; =0
100b50550:     	cbz	w8, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b50554:     	ldr	x8, [sp, #0x48]
100b50558:     	ldr	x9, [sp, #0x18]
100b5055c:     	cmp	x8, x9
100b50560:     	b.ne	0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b50564:     	ldr	x8, [sp, #0x50]
100b50568:     	ldr	x9, [sp, #0x18]
100b5056c:     	ldr	x9, [x9, #0x120]
100b50570:     	cmp	x8, x9
100b50574:     	b.ne	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50578:     	ldr	x8, [sp, #0x40]
100b5057c:     	ldr	x9, [x21, #0x68]
100b50580:     	cmp	x8, x9
100b50584:     	b.ne	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50588:     	mov	x0, x19
100b5058c:     	bl	0x100b94c9c <__Z26WM_window_get_active_scenePK8wmWindow>
100b50590:     	mov	x21, x0
100b50594:     	mov	w0, #0x0                ; =0
100b50598:     	cbz	x21, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b5059c:     	ldr	x8, [sp, #0x30]
100b505a0:     	cmp	x21, x8
100b505a4:     	b.ne	0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b505a8:     	ldr	x8, [x24]
100b505ac:     	add	x0, x8, #0x4b8
100b505b0:     	mov	x1, x21
100b505b4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b505b8:     	cmn	w0, #0x1
100b505bc:     	b.eq	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b505c0:     	ldr	w8, [x21, #0x144]
100b505c4:     	cbz	w8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b505c8:     	add	x1, x19, #0x38
100b505cc:     	mov	x0, x21
100b505d0:     	bl	0x100221a98 <__Z19BKE_view_layer_findPK5ScenePKc>
100b505d4:     	mov	x8, x0
100b505d8:     	mov	w0, #0x0                ; =0
100b505dc:     	str	x8, [sp, #0x18]
100b505e0:     	cbz	x8, 0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b505e4:     	ldr	x8, [sp, #0x38]
100b505e8:     	ldr	x9, [sp, #0x18]
100b505ec:     	cmp	x9, x8
100b505f0:     	b.ne	0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
100b505f4:     	mov	w8, #0x1620             ; =5664
100b505f8:     	add	x0, x21, x8
100b505fc:     	ldr	x1, [sp, #0x18]
100b50600:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b50604:     	cmn	w0, #0x1
100b50608:     	b.eq	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b5060c:     	ldr	x8, [sp, #0x18]
100b50610:     	ldrh	w8, [x8, #0x50]
100b50614:     	tbnz	w8, #0x3, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50618:     	ldr	x8, [sp, #0x18]
100b5061c:     	ldr	x1, [x8, #0x70]
100b50620:     	cbz	x1, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50624:     	ldr	x8, [sp, #0x18]
100b50628:     	add	x0, x8, #0x58
100b5062c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b50630:     	cmn	w0, #0x1
100b50634:     	b.eq	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50638:     	ldr	x8, [sp, #0x58]
100b5063c:     	str	x8, [sp, #0x10]
100b50640:     	cbz	x8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50644:     	ldp	x9, x8, [sp, #0x10]
100b50648:     	ldr	x8, [x8, #0x70]
100b5064c:     	ldr	x8, [x8, #0x10]
100b50650:     	cmp	x8, x9
100b50654:     	b.ne	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50658:     	ldr	x8, [x24]
100b5065c:     	add	x0, x8, #0x4d8
100b50660:     	ldr	x1, [sp, #0x10]
100b50664:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b50668:     	cmn	w0, #0x1
100b5066c:     	b.eq	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50670:     	ldr	x8, [sp, #0x10]
100b50674:     	ldr	w8, [x8, #0x144]
100b50678:     	cbz	w8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b5067c:     	ldr	x8, [sp, #0x10]
100b50680:     	ldrh	w8, [x8, #0x1b0]
100b50684:     	cmp	w8, #0x1
100b50688:     	b.ne	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b5068c:     	ldr	x8, [sp, #0x10]
100b50690:     	ldrb	w8, [x8, #0x2d8]
100b50694:     	tbz	w8, #0x0, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b50698:     	ldr	x8, [sp, #0x10]
100b5069c:     	ldr	x8, [x8, #0x238]
100b506a0:     	str	x8, [sp, #0x8]
100b506a4:     	cbz	x8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b506a8:     	ldr	x8, [x24]
100b506ac:     	add	x0, x8, #0x4e8
100b506b0:     	ldr	x1, [sp, #0x8]
100b506b4:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b506b8:     	cmn	w0, #0x1
100b506bc:     	b.eq	0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b506c0:     	ldr	x8, [sp, #0x8]
100b506c4:     	ldr	w8, [x8, #0x144]
100b506c8:     	cbz	w8, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b506cc:     	cbz	w22, 0x100b506dc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x3f4>
100b506d0:     	ldr	x0, [x25, #0x20]
100b506d4:     	bl	0x100b42da0 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
100b506d8:     	mov	x20, x0
100b506dc:     	cbz	x20, 0x100b503f8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x110>
100b506e0:     	ldr	x8, [x24]
100b506e4:     	ldr	w9, [x23, #0x144]
100b506e8:     	ldrsw	x10, [x19, #0xc0]
100b506ec:     	ldp	x2, x16, [sp, #0x20]
100b506f0:     	ldr	w11, [x2, #0x144]
100b506f4:     	ldr	w12, [x21, #0x144]
100b506f8:     	ldp	x4, x3, [sp, #0x8]
100b506fc:     	ldr	w13, [x3, #0x144]
100b50700:     	ldr	w14, [x4, #0x144]
100b50704:     	ldr	x15, [x25, #0x20]
100b50708:     	ldr	x17, [x16, #0xe8]
100b5070c:     	ldr	x0, [sp, #0x40]
100b50710:     	ldr	x1, [sp, #0x50]
100b50714:     	stp	x8, x23, [x28]
100b50718:     	stp	x9, x19, [x28, #0x10]
100b5071c:     	stp	x10, x2, [x28, #0x20]
100b50720:     	stp	x11, x27, [x28, #0x30]
100b50724:     	stp	x26, x21, [x28, #0x40]
100b50728:     	ldr	x10, [sp, #0x18]
100b5072c:     	stp	x12, x10, [x28, #0x50]
100b50730:     	stp	x3, x13, [x28, #0x60]
100b50734:     	stp	x4, x14, [x28, #0x70]
100b50738:     	stp	x15, x20, [x28, #0x80]
100b5073c:     	stp	x16, x17, [x28, #0x90]
100b50740:     	cmp	x8, #0x0
100b50744:     	ccmp	w9, #0x0, #0x4, ne
100b50748:     	stp	x25, x0, [x28, #0xa0]
100b5074c:     	ccmp	w11, #0x0, #0x4, ne
100b50750:     	ccmp	x17, #0x0, #0x4, ne
100b50754:     	cset	w0, ne
100b50758:     	str	x1, [x28, #0xb0]
100b5075c:     	b	0x100b503fc <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner+0x114>
