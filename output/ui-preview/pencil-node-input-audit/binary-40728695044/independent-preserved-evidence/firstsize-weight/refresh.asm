
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f91548 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea>:
101f91548:     	sub	sp, sp, #0xa0
101f9154c:     	stp	x26, x25, [sp, #0x50]
101f91550:     	stp	x24, x23, [sp, #0x60]
101f91554:     	stp	x22, x21, [sp, #0x70]
101f91558:     	stp	x20, x19, [sp, #0x80]
101f9155c:     	stp	x29, x30, [sp, #0x90]
101f91560:     	add	x29, sp, #0x90
101f91564:     	mov	x19, x1
101f91568:     	mov	x20, x0
101f9156c:     	bl	0x1000b3ba0 <__Z11CTX_wm_areaPK8bContext>
101f91570:     	cmp	x0, x19
101f91574:     	b.eq	0x101f91594 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x4c>
101f91578:     	ldp	x29, x30, [sp, #0x90]
101f9157c:     	ldp	x20, x19, [sp, #0x80]
101f91580:     	ldp	x22, x21, [sp, #0x70]
101f91584:     	ldp	x24, x23, [sp, #0x60]
101f91588:     	ldp	x26, x25, [sp, #0x50]
101f9158c:     	add	sp, sp, #0xa0
101f91590:     	ret
101f91594:     	movi.16b	v0, #0x0
101f91598:     	stur	q0, [sp, #0x3e]
101f9159c:     	stp	q0, q0, [sp, #0x20]
101f915a0:     	add	x1, sp, #0x20
101f915a4:     	mov	x0, x20
101f915a8:     	bl	0x101f900a8 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f915ac:     	ldr	x8, [sp, #0x20]
101f915b0:     	cmp	x8, #0x0
101f915b4:     	csel	w24, wzr, w0, eq
101f915b8:     	mov	x0, x19
101f915bc:     	mov	w1, #0x8                ; =8
101f915c0:     	bl	0x1003d66f0 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f915c4:     	mov	x22, x0
101f915c8:     	cbz	x0, 0x101f91620 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f915cc:     	tbnz	w24, #0x0, 0x101f91620 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f915d0:     	ldr	x8, [x22, #0x120]
101f915d4:     	cbz	x8, 0x101f91620 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xd8>
101f915d8:     	ldrb	w9, [x8, #0x3]
101f915dc:     	cmp	w9, #0x1
101f915e0:     	b.ne	0x101f91624 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xdc>
101f915e4:     	strb	wzr, [x8, #0x3]
101f915e8:     	mov	x0, x22
101f915ec:     	bl	0x1016203a8 <__Z20ED_region_tag_redrawP7ARegion>
101f915f0:     	ldrh	w8, [x22, #0xc4]
101f915f4:     	tbz	w8, #0x7, 0x101f91624 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xdc>
101f915f8:     	orr	w8, w8, #0x1
101f915fc:     	strh	w8, [x22, #0xc4]
101f91600:     	add	x0, x22, #0xa8
101f91604:     	mov	w1, #0x0                ; =0
101f91608:     	mov	w2, #0x0                ; =0
101f9160c:     	mov	w3, #0x0                ; =0
101f91610:     	mov	w4, #0x0                ; =0
101f91614:     	bl	0x1007fcfb4 <__Z13BLI_rcti_initP4rctiiiii>
101f91618:     	mov	x0, x22
101f9161c:     	b	0x101f91978 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x430>
101f91620:     	tbnz	w24, #0x0, 0x101f91630 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xe8>
101f91624:     	mov	x0, x20
101f91628:     	bl	0x101f912c8 <__Z21UI_ipad_corner_canvasP8bContext>
101f9162c:     	cbz	x0, 0x101f91578 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f91630:     	cbz	x22, 0x101f91658 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x110>
101f91634:     	ldrh	w8, [x22, #0xc4]
101f91638:     	tbz	w8, #0x7, 0x101f91640 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0xf8>
101f9163c:     	tbz	w24, #0x0, 0x101f91578 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f91640:     	ldr	x0, [x19, #0x58]
101f91644:     	mov	w1, #0x8                ; =8
101f91648:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f9164c:     	mov	x21, x22
101f91650:     	cbnz	x0, 0x101f916cc <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x184>
101f91654:     	b	0x101f91578 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f91658:     	ldr	x0, [x19, #0x58]
101f9165c:     	mov	w1, #0x8                ; =8
101f91660:     	bl	0x1003d5264 <__Z22BKE_regiontype_from_idPK9SpaceTypei>
101f91664:     	cbz	x0, 0x101f91578 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f91668:     	mov	x23, x0
101f9166c:     	bl	0x1003d59f8 <__Z19BKE_area_region_newv>
101f91670:     	mov	x21, x0
101f91674:     	mov	x0, x19
101f91678:     	mov	w1, #0x0                ; =0
101f9167c:     	bl	0x1003d66f0 <__Z25BKE_area_find_region_typePK7ScrAreai>
101f91680:     	cbz	x0, 0x101f91698 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x150>
101f91684:     	mov	x1, x0
101f91688:     	add	x0, x19, #0x78
101f9168c:     	mov	x2, x21
101f91690:     	bl	0x100790668 <__Z20BLI_insertlinkbeforeP8ListBasePvS1_>
101f91694:     	b	0x101f916a4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x15c>
101f91698:     	add	x0, x19, #0x78
101f9169c:     	mov	x1, x21
101f916a0:     	bl	0x10078fe74 <__Z11BLI_addtailP8ListBasePv>
101f916a4:     	mov	w8, #0x8                ; =8
101f916a8:     	movk	w8, #0x7, lsl #16
101f916ac:     	str	w8, [x21, #0xc0]
101f916b0:     	mov	w8, #0x1                ; =1
101f916b4:     	strh	w8, [x21, #0xca]
101f916b8:     	ldrh	w8, [x21, #0xc4]
101f916bc:     	orr	w8, w8, #0x4
101f916c0:     	strh	w8, [x21, #0xc4]
101f916c4:     	ldr	x8, [x21, #0x128]
101f916c8:     	str	x23, [x8, #0x170]
101f916cc:     	ldr	x23, [x21, #0x120]
101f916d0:     	mov	x0, x23
101f916d4:     	cbnz	x23, 0x101f91718 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1d0>
101f916d8:     	adrp	x8, 0x10665b000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x298>
101f916dc:     	add	x8, x8, #0x760
101f916e0:     	ldr	x8, [x8]
101f916e4:     	adrp	x3, 0x104d57000 <__ZL3hex+0x1875cd>
101f916e8:     	add	x3, x3, #0x61c
101f916ec:     	mov	w25, #0x1               ; =1
101f916f0:     	mov	w0, #0x1                ; =1
101f916f4:     	mov	w1, #0x38               ; =56
101f916f8:     	mov	w2, #0x8                ; =8
101f916fc:     	blr	x8
101f91700:     	mov	w8, #0xffff             ; =65535
101f91704:     	strh	w8, [x0]
101f91708:     	mov	w8, #-0x1               ; =-1
101f9170c:     	str	w8, [x0, #0x30]
101f91710:     	strb	w25, [x0, #0x2]
101f91714:     	str	x0, [x21, #0x120]
101f91718:     	strb	w24, [x0, #0x3]
101f9171c:     	ldrh	w8, [x21, #0xc4]
101f91720:     	tbnz	w8, #0x0, 0x101f91788 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x240>
101f91724:     	cbz	x23, 0x101f91790 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f91728:     	cbz	x22, 0x101f91790 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f9172c:     	ldr	x8, [x21, #0x128]
101f91730:     	ldrh	w8, [x8, #0x368]
101f91734:     	cbz	w8, 0x101f91790 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x248>
101f91738:     	cbz	w24, 0x101f917d4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x28c>
101f9173c:     	movi.16b	v0, #0x0
101f91740:     	stur	q0, [sp, #0x3e]
101f91744:     	stp	q0, q0, [sp, #0x20]
101f91748:     	add	x1, sp, #0x20
101f9174c:     	mov	x0, x20
101f91750:     	bl	0x101f900a8 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f91754:     	tbz	w0, #0x0, 0x101f91760 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x218>
101f91758:     	ldr	x22, [sp, #0x20]
101f9175c:     	cbnz	x22, 0x101f917e4 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x29c>
101f91760:     	ldrh	w8, [x21, #0xc4]
101f91764:     	orr	w8, w8, #0x1
101f91768:     	strh	w8, [x21, #0xc4]
101f9176c:     	add	x0, x21, #0xa8
101f91770:     	mov	w1, #0x0                ; =0
101f91774:     	mov	w2, #0x0                ; =0
101f91778:     	mov	w3, #0x0                ; =0
101f9177c:     	mov	w4, #0x0                ; =0
101f91780:     	bl	0x1007fcfb4 <__Z13BLI_rcti_initP4rctiiiii>
101f91784:     	b	0x101f91974 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x42c>
101f91788:     	and	w8, w8, #0xfffe
101f9178c:     	strh	w8, [x21, #0xc4]
101f91790:     	mov	x0, x19
101f91794:     	mov	x1, x21
101f91798:     	bl	0x101621850 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f9179c:     	mov	x0, x21
101f917a0:     	bl	0x1016203a8 <__Z20ED_region_tag_redrawP7ARegion>
101f917a4:     	mov	x0, x20
101f917a8:     	bl	0x1000b4200 <__Z14CTX_wm_managerPK8bContext>
101f917ac:     	mov	x22, x0
101f917b0:     	mov	x0, x20
101f917b4:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f917b8:     	mov	x1, x0
101f917bc:     	mov	x0, x22
101f917c0:     	mov	x2, x19
101f917c4:     	bl	0x101622954 <__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea>
101f917c8:     	mov	x0, x21
101f917cc:     	bl	0x1016237a8 <__Z23ED_region_floating_initP7ARegion>
101f917d0:     	cbnz	w24, 0x101f9173c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x1f4>
101f917d4:     	mov	x0, x20
101f917d8:     	bl	0x101f912c8 <__Z21UI_ipad_corner_canvasP8bContext>
101f917dc:     	mov	x22, x0
101f917e0:     	cbz	x22, 0x101f91760 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x218>
101f917e4:     	ldrh	w8, [x21, #0xc4]
101f917e8:     	mov	w9, #0x1                ; =1
101f917ec:     	bic	w8, w9, w8, lsr #1
101f917f0:     	ldr	x9, [x21, #0x128]
101f917f4:     	strh	w8, [x9, #0x368]
101f917f8:     	add	x0, x22, #0x10
101f917fc:     	add	x2, sp, #0x1c
101f91800:     	add	x3, sp, #0x18
101f91804:     	mov	w1, #0x1                ; =1
101f91808:     	bl	0x101fe1cc0 <__Z27UI_view2d_scroller_size_getPK6View2DbPfS2_>
101f9180c:     	ldr	x8, [x22, #0x128]
101f91810:     	ldr	s0, [x8, #0x160]
101f91814:     	scvtf	s0, s0
101f91818:     	ldr	s1, [sp, #0x18]
101f9181c:     	fcmp	s1, s0
101f91820:     	fcsel	s0, s0, s1, mi
101f91824:     	str	s0, [sp, #0x18]
101f91828:     	ldur	q1, [x21, #0xa8]
101f9182c:     	str	q1, [sp]
101f91830:     	ldr	w8, [x21, #0xa8]
101f91834:     	ldr	x9, [x21, #0x128]
101f91838:     	ldr	w10, [x9, #0x198]
101f9183c:     	sub	w23, w8, w10
101f91840:     	ldr	w8, [x21, #0xb0]
101f91844:     	ldr	w9, [x9, #0x19c]
101f91848:     	sub	w25, w8, w9
101f9184c:     	cbz	w24, 0x101f91890 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x348>
101f91850:     	movi.16b	v0, #0x0
101f91854:     	stur	q0, [sp, #0x3e]
101f91858:     	stp	q0, q0, [sp, #0x20]
101f9185c:     	add	x1, sp, #0x20
101f91860:     	mov	x0, x20
101f91864:     	bl	0x101f900a8 <__ZL21ipad_knife_hud_layoutPK8bContextR18IPadKnifeHUDLayout>
101f91868:     	tbz	w0, #0x0, 0x101f9188c <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x344>
101f9186c:     	ldr	w8, [sp, #0x28]
101f91870:     	ldr	w9, [sp, #0x30]
101f91874:     	sub	w8, w8, w23
101f91878:     	scvtf	s1, w8
101f9187c:     	sub	w8, w9, w25
101f91880:     	scvtf	s0, w8
101f91884:     	stp	s0, s1, [sp, #0x18]
101f91888:     	b	0x101f91890 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x348>
101f9188c:     	ldr	s0, [sp, #0x18]
101f91890:     	ldr	s1, [sp, #0x1c]
101f91894:     	fcvtzs	w8, s1
101f91898:     	add	w8, w23, w8
101f9189c:     	ldr	w9, [sp]
101f918a0:     	ldr	w10, [sp, #0x8]
101f918a4:     	sub	w1, w8, w9
101f918a8:     	fcvtzs	w8, s0
101f918ac:     	add	w8, w25, w8
101f918b0:     	sub	w2, w8, w10
101f918b4:     	mov	x0, sp
101f918b8:     	bl	0x1007fd340 <__Z18BLI_rcti_translateP4rctiii>
101f918bc:     	mov	x0, x20
101f918c0:     	bl	0x1000b4218 <__Z13CTX_wm_windowPK8bContext>
101f918c4:     	mov	x1, x0
101f918c8:     	mov	x4, sp
101f918cc:     	add	x5, sp, #0x20
101f918d0:     	mov	x0, x20
101f918d4:     	mov	x2, x19
101f918d8:     	mov	x3, x22
101f918dc:     	bl	0x10163c6c8 <__Z24ED_ipad_hud_exposed_rectP8bContextP8wmWindowP7ScrAreaPK7ARegionRK4rctiRS8_>
101f918e0:     	cbz	w0, 0x101f918f8 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3b0>
101f918e4:     	ldr	w8, [sp, #0x20]
101f918e8:     	tbnz	w24, #0x0, 0x101f918f0 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3a8>
101f918ec:     	ldr	w23, [x22, #0xa8]
101f918f0:     	sub	w8, w8, w23
101f918f4:     	b	0x101f91918 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3d0>
101f918f8:     	ldr	x8, [x22, #0x128]
101f918fc:     	ldr	w8, [x8, #0x158]
101f91900:     	cbz	w24, 0x101f91910 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3c8>
101f91904:     	ldr	w9, [x22, #0xa8]
101f91908:     	sub	w9, w9, w23
101f9190c:     	b	0x101f91914 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x3cc>
101f91910:     	mov	w9, #0x0                ; =0
101f91914:     	add	w8, w9, w8
101f91918:     	scvtf	s0, w8
101f9191c:     	ldr	s1, [sp, #0x1c]
101f91920:     	fcmp	s1, s0
101f91924:     	fcsel	s0, s0, s1, mi
101f91928:     	str	s0, [sp, #0x1c]
101f9192c:     	ldr	x8, [x21, #0x128]
101f91930:     	ldr	s1, [x8, #0x198]
101f91934:     	scvtf	s2, s1
101f91938:     	ldr	s1, [sp, #0x18]
101f9193c:     	fcmp	s0, s2
101f91940:     	b.ne	0x101f91954 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x40c>
101f91944:     	ldr	s2, [x8, #0x19c]
101f91948:     	scvtf	s2, s2
101f9194c:     	fcmp	s1, s2
101f91950:     	b.eq	0x101f91578 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
101f91954:     	fcvtzs	w9, s0
101f91958:     	str	w9, [x8, #0x198]
101f9195c:     	fcvtzs	w8, s1
101f91960:     	ldr	x9, [x21, #0x128]
101f91964:     	str	w8, [x9, #0x19c]
101f91968:     	mov	x0, x19
101f9196c:     	mov	x1, x21
101f91970:     	bl	0x101621850 <__Z30ED_area_tag_region_size_updateP7ScrAreaP7ARegion>
101f91974:     	mov	x0, x21
101f91978:     	bl	0x1016203a8 <__Z20ED_region_tag_redrawP7ARegion>
101f9197c:     	b	0x101f91578 <__Z26UI_ipad_corner_hud_refreshP8bContextP7ScrArea+0x30>
