
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b50760 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner>:
100b50760:     	sub	sp, sp, #0x1d0
100b50764:     	stp	x26, x25, [sp, #0x180]
100b50768:     	stp	x24, x23, [sp, #0x190]
100b5076c:     	stp	x22, x21, [sp, #0x1a0]
100b50770:     	stp	x20, x19, [sp, #0x1b0]
100b50774:     	stp	x29, x30, [sp, #0x1c0]
100b50778:     	add	x29, sp, #0x1c0
100b5077c:     	mov	w23, #0x0               ; =0
100b50780:     	str	xzr, [x3, #0xb0]
100b50784:     	movi.16b	v0, #0x0
100b50788:     	stp	q0, q0, [x3, #0x90]
100b5078c:     	stp	q0, q0, [x3, #0x70]
100b50790:     	stp	q0, q0, [x3, #0x50]
100b50794:     	stp	q0, q0, [x3, #0x30]
100b50798:     	stp	q0, q0, [x3, #0x10]
100b5079c:     	str	q0, [x3]
100b507a0:     	cbz	x1, 0x100b50820 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b507a4:     	adrp	x8, 0x106d88000 <_build_commit_date>
100b507a8:     	add	x8, x8, #0x28
100b507ac:     	ldr	x8, [x8]
100b507b0:     	cbz	x8, 0x100b50820 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b507b4:     	ldr	x23, [x8, #0x678]
100b507b8:     	cbz	x23, 0x100b50820 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b507bc:     	mov	x19, x1
100b507c0:     	mov	x20, x0
100b507c4:     	mov	x21, x2
100b507c8:     	mov	x22, x3
100b507cc:     	mov	x25, #0x0               ; =0
100b507d0:     	b	0x100b507e4 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x84>
100b507d4:     	mov	x24, x25
100b507d8:     	ldr	x23, [x23]
100b507dc:     	mov	x25, x24
100b507e0:     	cbz	x23, 0x100b50804 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xa4>
100b507e4:     	add	x0, x23, #0x1a0
100b507e8:     	mov	x1, x19
100b507ec:     	bl	0x10078ff24 <__Z13BLI_findindexPK8ListBasePKv>
100b507f0:     	cmn	w0, #0x1
100b507f4:     	b.eq	0x100b507d4 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x74>
100b507f8:     	mov	x24, x23
100b507fc:     	cbz	x25, 0x100b507d8 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x78>
100b50800:     	b	0x100b5081c <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50804:     	cbz	x20, 0x100b50820 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b50808:     	cbz	x24, 0x100b50820 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b5080c:     	mov	x0, x20
100b50810:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
100b50814:     	cmp	x0, x24
100b50818:     	b.eq	0x100b50840 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xe0>
100b5081c:     	mov	w23, #0x0               ; =0
100b50820:     	and	w0, w23, #0x1
100b50824:     	ldp	x29, x30, [sp, #0x1c0]
100b50828:     	ldp	x20, x19, [sp, #0x1b0]
100b5082c:     	ldp	x22, x21, [sp, #0x1a0]
100b50830:     	ldp	x24, x23, [sp, #0x190]
100b50834:     	ldp	x26, x25, [sp, #0x180]
100b50838:     	add	sp, sp, #0x1d0
100b5083c:     	ret
100b50840:     	mov	x0, x20
100b50844:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
100b50848:     	mov	w23, #0x0               ; =0
100b5084c:     	cbz	x21, 0x100b50820 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b50850:     	cmp	x0, x19
100b50854:     	b.ne	0x100b50820 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b50858:     	ldr	x20, [x19, #0x118]
100b5085c:     	cbz	x20, 0x100b5081c <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50860:     	mov	x2, x21
100b50864:     	mov	w23, #0x0               ; =0
100b50868:     	movi.16b	v2, #0x0
100b5086c:     	b	0x100b50878 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x118>
100b50870:     	ldr	x20, [x20]
100b50874:     	cbz	x20, 0x100b50820 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xc0>
100b50878:     	ldr	w8, [x20, #0x10]
100b5087c:     	cmp	w8, #0x3
100b50880:     	b.ne	0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b50884:     	ldrb	w8, [x20, #0x14]
100b50888:     	tbnz	w8, #0x7, 0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b5088c:     	str	xzr, [sp, #0xb0]
100b50890:     	stp	q2, q2, [sp, #0x90]
100b50894:     	stp	q2, q2, [sp, #0x70]
100b50898:     	stp	q2, q2, [sp, #0x50]
100b5089c:     	stp	q2, q2, [sp, #0x30]
100b508a0:     	stp	q2, q2, [sp, #0x10]
100b508a4:     	str	q2, [sp]
100b508a8:     	add	x8, x20, #0x178
100b508ac:     	ldp	q0, q1, [x8, #0x80]
100b508b0:     	stp	q0, q1, [sp, #0x140]
100b508b4:     	ldr	q0, [x8, #0xa0]
100b508b8:     	str	q0, [sp, #0x160]
100b508bc:     	ldr	x9, [x20, #0x228]
100b508c0:     	str	x9, [sp, #0x170]
100b508c4:     	ldp	q0, q1, [x8, #0x40]
100b508c8:     	stp	q0, q1, [sp, #0x100]
100b508cc:     	ldp	q0, q1, [x8, #0x60]
100b508d0:     	stp	q0, q1, [sp, #0x120]
100b508d4:     	ldp	q0, q1, [x8]
100b508d8:     	stp	q0, q1, [sp, #0xc0]
100b508dc:     	ldp	q0, q1, [x8, #0x20]
100b508e0:     	stp	q0, q1, [sp, #0xe0]
100b508e4:     	ldr	x8, [sp, #0xc0]
100b508e8:     	cbz	x8, 0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b508ec:     	ldr	x8, [sp, #0xd0]
100b508f0:     	cbz	x8, 0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b508f4:     	ldr	x8, [sp, #0xf0]
100b508f8:     	cbz	x8, 0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b508fc:     	ldr	x8, [sp, #0x148]
100b50900:     	cbz	x8, 0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b50904:     	ldr	x8, [sp, #0x158]
100b50908:     	cbz	x8, 0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b5090c:     	ldr	x8, [sp, #0xf8]
100b50910:     	cmp	x8, x2
100b50914:     	b.ne	0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
100b50918:     	ldr	x3, [sp, #0x100]
100b5091c:     	mov	x5, sp
100b50920:     	mov	x0, x19
100b50924:     	mov	x1, x20
100b50928:     	mov	w4, #0x0                ; =0
100b5092c:     	bl	0x100b502e8 <__ZL24wm_ipad_knife_owner_readP8wmWindowP17wmEventHandler_OpmmbR16wmIPadKnifeOwner>
100b50930:     	cbz	w0, 0x100b5081c <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50934:     	mov	x0, sp
100b50938:     	add	x1, sp, #0xc0
100b5093c:     	mov	w2, #0xb8               ; =184
100b50940:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
100b50944:     	cmp	w0, #0x0
100b50948:     	cset	w8, ne
100b5094c:     	orr	w8, w8, w23
100b50950:     	tbnz	w8, #0x0, 0x100b5081c <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0xbc>
100b50954:     	ldp	q0, q1, [sp, #0x80]
100b50958:     	stp	q0, q1, [x22, #0x80]
100b5095c:     	ldr	q0, [sp, #0xa0]
100b50960:     	str	q0, [x22, #0xa0]
100b50964:     	ldr	x9, [sp, #0xb0]
100b50968:     	str	x9, [x22, #0xb0]
100b5096c:     	ldp	q0, q1, [sp, #0x40]
100b50970:     	stp	q0, q1, [x22, #0x40]
100b50974:     	ldp	q0, q1, [sp, #0x60]
100b50978:     	stp	q0, q1, [x22, #0x60]
100b5097c:     	ldp	q0, q1, [sp]
100b50980:     	stp	q0, q1, [x22]
100b50984:     	ldp	q0, q1, [sp, #0x20]
100b50988:     	mov	w23, #0x1               ; =1
100b5098c:     	stp	q0, q1, [x22, #0x20]
100b50990:     	mov	x2, x21
100b50994:     	movi.16b	v2, #0x0
100b50998:     	b	0x100b50870 <__Z27WM_ipad_knife_owner_presentPK8bContextP8wmWindowP7ScrAreaR16wmIPadKnifeOwner+0x110>
