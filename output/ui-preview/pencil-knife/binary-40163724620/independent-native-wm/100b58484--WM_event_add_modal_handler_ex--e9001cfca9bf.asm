
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b58484 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator>:
100b58484:     	sub	sp, sp, #0x180
100b58488:     	stp	x28, x27, [sp, #0x120]
100b5848c:     	stp	x26, x25, [sp, #0x130]
100b58490:     	stp	x24, x23, [sp, #0x140]
100b58494:     	stp	x22, x21, [sp, #0x150]
100b58498:     	stp	x20, x19, [sp, #0x160]
100b5849c:     	stp	x29, x30, [sp, #0x170]
100b584a0:     	add	x29, sp, #0x170
100b584a4:     	mov	x20, x3
100b584a8:     	mov	x22, x2
100b584ac:     	mov	x23, x1
100b584b0:     	mov	x19, x0
100b584b4:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
100b584b8:     	ldr	x8, [x8, #0x7f0]
100b584bc:     	ldr	x8, [x8]
100b584c0:     	stur	x8, [x29, #-0x68]
100b584c4:     	ldr	x8, [x0, #0x10]
100b584c8:     	str	x8, [sp, #0x10]
100b584cc:     	cbz	x8, 0x100b58518 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x94>
100b584d0:     	add	x8, sp, #0x10
100b584d4:     	str	x8, [sp, #0x20]
100b584d8:     	adrp	x0, 0x106368000 <_zlibVersion+0x106368000>
100b584dc:     	ldr	x0, [x0, #0x748]
100b584e0:     	adrp	x2, 0x10636c000 <_zlibVersion+0x10636c000>
100b584e4:     	ldr	x2, [x2, #0x188]
100b584e8:     	add	x1, sp, #0x10
100b584ec:     	add	x3, sp, #0x20
100b584f0:     	add	x4, sp, #0x1f
100b584f4:     	bl	0x100b4b7b8 <__ZNSt3__112__hash_tableINS_17__hash_value_typeIPKvNS_6vectorIN5ghost3ios15FingerPaintRectENS_9allocatorIS7_EEEEEENS_22__unordered_map_hasherIS3_SB_NS_4hashIS3_EENS_8equal_toIS3_EELb1EEENS_21__unordered_map_equalIS3_SB_SG_SE_Lb1EEENS8_ISB_EEE25__emplace_unique_key_argsIS3_JRKNS_21piecewise_construct_tENS_5tupleIJRKS3_EEENSQ_IJEEEEEENS_4pairINS_15__hash_iteratorIPNS_11__hash_nodeISB_PvEEEEbEERKT_DpOT0_>
100b584f8:     	mov	x21, x0
100b584fc:     	ldr	x8, [x21, #0x18]!
100b58500:     	cbz	x8, 0x100b58510 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x8c>
100b58504:     	str	x8, [x0, #0x20]
100b58508:     	mov	x0, x8
100b5850c:     	bl	0x104b714bc <_zlibVersion+0x104b714bc>
100b58510:     	stp	xzr, xzr, [x21]
100b58514:     	str	xzr, [x21, #0x10]
100b58518:     	adrp	x8, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b5851c:     	add	x8, x8, #0x6e0
100b58520:     	ldr	x8, [x8]
100b58524:     	adrp	x3, 0x104bd0000 <__ZL3hex+0x434d>
100b58528:     	add	x3, x3, #0x9d0
100b5852c:     	mov	w0, #0x1                ; =1
100b58530:     	mov	w1, #0x230              ; =560
100b58534:     	mov	w2, #0x8                ; =8
100b58538:     	blr	x8
100b5853c:     	mov	x21, x0
100b58540:     	mov	w8, #0x3                ; =3
100b58544:     	str	w8, [x0, #0x10]
100b58548:     	ldr	x8, [x20, #0x90]
100b5854c:     	add	x24, x0, #0x20
100b58550:     	mov	x9, x24
100b58554:     	cbz	x8, 0x100b58560 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0xdc>
100b58558:     	str	x8, [x24]
100b5855c:     	add	x9, x8, #0x90
100b58560:     	str	x20, [x9]
100b58564:     	stp	x23, x22, [x21, #0x38]
100b58568:     	cbz	x22, 0x100b58574 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0xf0>
100b5856c:     	ldrh	w8, [x22, #0xc0]
100b58570:     	b	0x100b58578 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0xf4>
100b58574:     	mov	w8, #0xffff             ; =65535
100b58578:     	strh	w8, [x21, #0x48]
100b5857c:     	ldr	x8, [x21, #0x20]
100b58580:     	ldr	x8, [x8, #0x58]
100b58584:     	ldrb	w8, [x8, #0xe5]
100b58588:     	tbnz	w8, #0x4, 0x100b585e0 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x15c>
100b5858c:     	ldr	x8, [x19, #0x118]
100b58590:     	cbz	x8, 0x100b585e0 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x15c>
100b58594:     	mov	x1, #0x0                ; =0
100b58598:     	b	0x100b585a4 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x120>
100b5859c:     	ldr	x8, [x8]
100b585a0:     	cbz	x8, 0x100b585cc <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x148>
100b585a4:     	ldr	w9, [x8, #0x10]
100b585a8:     	cmp	w9, #0x3
100b585ac:     	b.ne	0x100b5859c <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x118>
100b585b0:     	ldr	x9, [x8, #0x20]
100b585b4:     	cbz	x9, 0x100b5859c <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x118>
100b585b8:     	ldr	x9, [x9, #0x58]
100b585bc:     	ldrh	w9, [x9, #0xe4]
100b585c0:     	tst	w9, #0x1000
100b585c4:     	csel	x1, x1, x8, eq
100b585c8:     	b	0x100b5859c <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x118>
100b585cc:     	cbz	x1, 0x100b585e0 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x15c>
100b585d0:     	add	x0, x19, #0x118
100b585d4:     	mov	x2, x21
100b585d8:     	bl	0x100790020 <__Z19BLI_insertlinkafterP8ListBasePvS1_>
100b585dc:     	b	0x100b585ec <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x168>
100b585e0:     	add	x0, x19, #0x118
100b585e4:     	mov	x1, x21
100b585e8:     	bl	0x10078fe0c <__Z11BLI_addheadP8ListBasePv>
100b585ec:     	str	xzr, [sp, #0xd0]
100b585f0:     	movi.16b	v0, #0x0
100b585f4:     	stp	q0, q0, [sp, #0xb0]
100b585f8:     	stp	q0, q0, [sp, #0x90]
100b585fc:     	stp	q0, q0, [sp, #0x70]
100b58600:     	stp	q0, q0, [sp, #0x50]
100b58604:     	stp	q0, q0, [sp, #0x30]
100b58608:     	str	q0, [sp, #0x20]
100b5860c:     	add	x5, sp, #0x20
100b58610:     	mov	x0, x19
100b58614:     	mov	x1, x21
100b58618:     	mov	x2, x23
100b5861c:     	mov	x3, x22
100b58620:     	mov	w4, #0x1                ; =1
100b58624:     	bl	0x100b502e8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner>
100b58628:     	cbz	w0, 0x100b58668 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x1e4>
100b5862c:     	add	x8, x21, #0x178
100b58630:     	ldr	x9, [sp, #0xd0]
100b58634:     	str	x9, [x21, #0x228]
100b58638:     	ldp	q0, q1, [sp, #0xa0]
100b5863c:     	stp	q0, q1, [x8, #0x80]
100b58640:     	ldr	q0, [sp, #0xc0]
100b58644:     	str	q0, [x8, #0xa0]
100b58648:     	ldp	q0, q1, [sp, #0x60]
100b5864c:     	stp	q0, q1, [x8, #0x40]
100b58650:     	ldp	q0, q1, [sp, #0x80]
100b58654:     	stp	q0, q1, [x8, #0x60]
100b58658:     	ldp	q0, q1, [sp, #0x20]
100b5865c:     	stp	q0, q1, [x8]
100b58660:     	ldp	q0, q1, [sp, #0x40]
100b58664:     	stp	q0, q1, [x8, #0x20]
100b58668:     	ldr	x8, [x20, #0x90]
100b5866c:     	cbnz	x8, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58670:     	adrp	x0, 0x106d86000 <__PyRuntime+0x280b8>
100b58674:     	add	x0, x0, #0xb78
100b58678:     	ldr	x8, [x0]
100b5867c:     	blr	x8
100b58680:     	ldrb	w8, [x0, #0xc0]
100b58684:     	cmp	w8, #0x1
100b58688:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b5868c:     	cbz	x21, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58690:     	mov	x22, x0
100b58694:     	ldr	x8, [x0, #0x8]
100b58698:     	cmp	x8, x19
100b5869c:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b586a0:     	ldr	w8, [x21, #0x10]
100b586a4:     	cmp	w8, #0x3
100b586a8:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b586ac:     	ldr	x8, [x24]
100b586b0:     	cmp	x8, x20
100b586b4:     	b.eq	0x100b58730 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x2ac>
100b586b8:     	ldr	x8, [x20, #0x58]
100b586bc:     	ldr	x8, [x8, #0xb0]
100b586c0:     	cbz	x8, 0x100b586f4 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x270>
100b586c4:     	mov	x0, x19
100b586c8:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b586cc:     	ldrb	w8, [x0, #0x1ef]
100b586d0:     	cmp	w8, #0x2
100b586d4:     	b.eq	0x100b586f4 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x270>
100b586d8:     	add	x0, x19, #0xa8
100b586dc:     	ldr	x0, [x0]
100b586e0:     	cbz	x0, 0x100b586f4 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x270>
100b586e4:     	ldrb	w8, [x0, #0x48]
100b586e8:     	cmp	w8, #0x16
100b586ec:     	b.ne	0x100b586dc <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x258>
100b586f0:     	bl	0x10161f494 <__Z18ED_area_tag_redrawP7ScrArea>
100b586f4:     	ldur	x8, [x29, #-0x68]
100b586f8:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
100b586fc:     	ldr	x9, [x9, #0x7f0]
100b58700:     	ldr	x9, [x9]
100b58704:     	cmp	x9, x8
100b58708:     	b.ne	0x100b589ec <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x568>
100b5870c:     	mov	x0, x21
100b58710:     	ldp	x29, x30, [sp, #0x170]
100b58714:     	ldp	x20, x19, [sp, #0x160]
100b58718:     	ldp	x22, x21, [sp, #0x150]
100b5871c:     	ldp	x24, x23, [sp, #0x140]
100b58720:     	ldp	x26, x25, [sp, #0x130]
100b58724:     	ldp	x28, x27, [sp, #0x120]
100b58728:     	add	sp, sp, #0x180
100b5872c:     	ret
100b58730:     	ldr	x23, [x22]
100b58734:     	add	x0, x19, #0x118
100b58738:     	mov	x1, x21
100b5873c:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b58740:     	cmn	w0, #0x1
100b58744:     	b.eq	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58748:     	ldr	x8, [x20, #0x90]
100b5874c:     	cbnz	x8, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58750:     	ldr	x8, [x20, #0x58]
100b58754:     	cbz	x8, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58758:     	ldrb	w8, [x22, #0x89]
100b5875c:     	cmp	w8, #0x2
100b58760:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58764:     	ldrh	w8, [x22, #0x20]
100b58768:     	cmp	w8, #0x1
100b5876c:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58770:     	ldrh	w8, [x22, #0x22]
100b58774:     	cmp	w8, #0x1
100b58778:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b5877c:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b58780:     	add	x0, x0, #0xfbe
100b58784:     	mov	w1, #0x0                ; =0
100b58788:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b5878c:     	ldr	x8, [x20, #0x58]
100b58790:     	cmp	x0, x8
100b58794:     	b.eq	0x100b587fc <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x378>
100b58798:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b5879c:     	add	x0, x0, #0xfd5
100b587a0:     	mov	w1, #0x0                ; =0
100b587a4:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b587a8:     	ldr	x8, [x20, #0x58]
100b587ac:     	cmp	x0, x8
100b587b0:     	b.eq	0x100b5880c <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x388>
100b587b4:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b587b8:     	add	x0, x0, #0xfeb
100b587bc:     	mov	w1, #0x0                ; =0
100b587c0:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b587c4:     	ldr	x8, [x20, #0x58]
100b587c8:     	cmp	x0, x8
100b587cc:     	b.eq	0x100b5881c <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x398>
100b587d0:     	adrp	x0, 0x104bd1000 <__ZL3hex+0x534d>
100b587d4:     	add	x0, x0, #0x1
100b587d8:     	mov	w1, #0x0                ; =0
100b587dc:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b587e0:     	ldr	x8, [x20, #0x58]
100b587e4:     	cmp	x0, x8
100b587e8:     	b.eq	0x100b5882c <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x3a8>
100b587ec:     	mov	w24, #0x0               ; =0
100b587f0:     	str	wzr, [sp, #0xc]
100b587f4:     	mov	x25, #0x0               ; =0
100b587f8:     	b	0x100b5884c <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x3c8>
100b587fc:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b58800:     	add	x0, x0, #0xfbe
100b58804:     	mov	w8, #0x2                ; =2
100b58808:     	b	0x100b58838 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x3b4>
100b5880c:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b58810:     	add	x0, x0, #0xfd5
100b58814:     	mov	w8, #0x4                ; =4
100b58818:     	b	0x100b58838 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x3b4>
100b5881c:     	adrp	x0, 0x104bd0000 <__ZL3hex+0x434d>
100b58820:     	add	x0, x0, #0xfeb
100b58824:     	mov	w8, #0x8                ; =8
100b58828:     	b	0x100b58838 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x3b4>
100b5882c:     	adrp	x0, 0x104bd1000 <__ZL3hex+0x534d>
100b58830:     	add	x0, x0, #0x1
100b58834:     	mov	w8, #0x10               ; =16
100b58838:     	str	w8, [sp, #0xc]
100b5883c:     	mov	w1, #0x0                ; =0
100b58840:     	bl	0x100b7bc38 <__Z20WM_operatortype_findPKcb>
100b58844:     	mov	x25, x0
100b58848:     	mov	w24, #0x1               ; =1
100b5884c:     	mov	x0, x23
100b58850:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b58854:     	mov	x27, x0
100b58858:     	mov	x0, x19
100b5885c:     	bl	0x104a5d394 <__Z27WM_window_get_active_screenPK8wmWindow>
100b58860:     	add	x28, sp, #0x20
100b58864:     	movi.16b	v0, #0x0
100b58868:     	stur	q0, [x28, #0xc9]
100b5886c:     	stp	q0, q0, [sp, #0xd0]
100b58870:     	stp	q0, q0, [sp, #0xb0]
100b58874:     	stp	q0, q0, [sp, #0x90]
100b58878:     	stp	q0, q0, [sp, #0x70]
100b5887c:     	stp	q0, q0, [sp, #0x50]
100b58880:     	stp	q0, q0, [sp, #0x30]
100b58884:     	cmp	x25, #0x0
100b58888:     	csel	w8, wzr, w24, eq
100b5888c:     	str	q0, [sp, #0x20]
100b58890:     	cmp	w8, #0x1
100b58894:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58898:     	ldr	x8, [x20, #0x58]
100b5889c:     	cmp	x25, x8
100b588a0:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588a4:     	ldr	x8, [x25, #0x48]
100b588a8:     	cbz	x8, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588ac:     	ldr	x8, [x25, #0x40]
100b588b0:     	cbz	x8, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588b4:     	ldr	x8, [x25, #0xe8]
100b588b8:     	cbz	x8, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588bc:     	cbz	x27, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588c0:     	ldr	x8, [x27, #0x5c0]
100b588c4:     	cbz	x8, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588c8:     	mov	x26, x0
100b588cc:     	cbz	x0, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588d0:     	mov	x0, x23
100b588d4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b588d8:     	cmp	x0, x19
100b588dc:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588e0:     	ldr	x24, [x21, #0x38]
100b588e4:     	mov	x0, x23
100b588e8:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
100b588ec:     	cmp	x24, x0
100b588f0:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b588f4:     	ldr	x24, [x21, #0x40]
100b588f8:     	mov	x0, x23
100b588fc:     	bl	0x1000b3b88 <__Z13CTX_wm_regionPK8bContext>
100b58900:     	cmp	x24, x0
100b58904:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58908:     	ldr	x8, [x21, #0x40]
100b5890c:     	ldr	x9, [x22, #0x78]
100b58910:     	cmp	x9, x8
100b58914:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58918:     	add	x1, x22, #0x10
100b5891c:     	mov	x0, x23
100b58920:     	ldr	w2, [sp, #0xc]
100b58924:     	bl	0x100b53f58 <__Z37WM_ipad_pencil_paint_contact_validateP8bContextPK7wmEventi>
100b58928:     	cbz	w0, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b5892c:     	add	x1, sp, #0x20
100b58930:     	mov	x0, x23
100b58934:     	bl	0x10163f3f8 <__Z28ED_ipad_finger_paint_captureP8bContextR20IPadFingerPaintOwner>
100b58938:     	cbz	w0, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b5893c:     	ldrb	w8, [sp, #0xf8]
100b58940:     	cmp	w8, #0x1
100b58944:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58948:     	ldr	w8, [sp, #0x68]
100b5894c:     	ldr	w9, [sp, #0xc]
100b58950:     	cmp	w9, w8
100b58954:     	b.ne	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58958:     	mov	x0, x20
100b5895c:     	bl	0x100b42da0 <__Z29WM_operator_touch_lifetime_idPK10wmOperator>
100b58960:     	cbz	x0, 0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b58964:     	ldr	x8, [x22, #0x68]
100b58968:     	str	x8, [x21, #0x50]
100b5896c:     	ldr	x8, [x22, #0x70]
100b58970:     	stp	x8, x0, [x21, #0x58]
100b58974:     	ldr	x8, [x25, #0xe8]
100b58978:     	str	x8, [x21, #0x68]
100b5897c:     	ldr	w8, [x26, #0x144]
100b58980:     	stp	x8, x25, [x21, #0x70]
100b58984:     	ldur	q0, [x21, #0x38]
100b58988:     	str	q0, [x21, #0x80]
100b5898c:     	ldr	d0, [x22, #0x80]
100b58990:     	str	d0, [x21, #0x90]
100b58994:     	ldr	w8, [sp, #0xc]
100b58998:     	str	w8, [x21, #0x98]
100b5899c:     	ldp	q1, q0, [sp, #0x20]
100b589a0:     	stp	q1, q0, [x21, #0xa0]
100b589a4:     	ldr	x8, [sp, #0x80]
100b589a8:     	str	x8, [x21, #0x100]
100b589ac:     	ldp	q1, q0, [sp, #0x60]
100b589b0:     	stp	q1, q0, [x21, #0xe0]
100b589b4:     	ldp	q0, q1, [sp, #0x40]
100b589b8:     	stp	q0, q1, [x21, #0xc0]
100b589bc:     	ldr	x8, [sp, #0xb0]
100b589c0:     	str	x8, [x21, #0x130]
100b589c4:     	ldr	q0, [sp, #0xa0]
100b589c8:     	str	q0, [x21, #0x120]
100b589cc:     	add	x8, x21, #0x138
100b589d0:     	ldur	q0, [x28, #0x98]
100b589d4:     	ldur	q1, [x28, #0xa8]
100b589d8:     	ldur	q2, [x28, #0xb8]
100b589dc:     	ldur	q3, [x28, #0xc8]
100b589e0:     	stp	q2, q3, [x8, #0x20]
100b589e4:     	stp	q0, q1, [x8]
100b589e8:     	b	0x100b586b8 <__Z29WM_event_add_modal_handler_exP8wmWindowP7ScrAreaP7ARegionP10wmOperator+0x234>
100b589ec:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
100b589f0:     	bl	0x104b6ef30 <_zlibVersion+0x104b6ef30>
