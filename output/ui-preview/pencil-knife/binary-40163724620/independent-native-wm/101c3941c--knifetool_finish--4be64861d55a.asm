
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c3941c <__ZL16knifetool_finishP10wmOperator>:
101c3941c:     	sub	sp, sp, #0x40
101c39420:     	stp	x22, x21, [sp, #0x10]
101c39424:     	stp	x20, x19, [sp, #0x20]
101c39428:     	stp	x29, x30, [sp, #0x30]
101c3942c:     	add	x29, sp, #0x30
101c39430:     	ldr	x19, [x0, #0x60]
101c39434:     	ldp	x20, x21, [x19, #0x80]
101c39438:     	subs	x8, x21, x20
101c3943c:     	b.eq	0x101c39464 <__ZL16knifetool_finishP10wmOperator+0x48>
101c39440:     	mov	x20, #0x0               ; =0
101c39444:     	asr	x21, x8, #3
101c39448:     	mov	x0, x19
101c3944c:     	mov	x1, x20
101c39450:     	bl	0x101c36754 <__ZL27knifetool_finish_single_preP16KnifeTool_OpDatai>
101c39454:     	add	x20, x20, #0x1
101c39458:     	cmp	x21, x20
101c3945c:     	b.ne	0x101c39448 <__ZL16knifetool_finishP10wmOperator+0x2c>
101c39460:     	ldp	x20, x21, [x19, #0x80]
101c39464:     	cmp	x20, x21
101c39468:     	b.eq	0x101c39498 <__ZL16knifetool_finishP10wmOperator+0x7c>
101c3946c:     	mov	w22, #0x7               ; =7
101c39470:     	ldr	x19, [x20], #0x8
101c39474:     	mov	x0, x19
101c39478:     	bl	0x10017c608 <__Z24BKE_editmesh_from_objectP6Object>
101c3947c:     	bl	0x101c6edbc <__Z21EDBM_selectmode_flushP10BMEditMesh>
101c39480:     	str	w22, [sp, #0xc]
101c39484:     	ldr	x0, [x19, #0x238]
101c39488:     	add	x1, sp, #0xc
101c3948c:     	bl	0x101c71354 <__Z11EDBM_updateP4MeshPK17EDBMUpdate_Params>
101c39490:     	cmp	x20, x21
101c39494:     	b.ne	0x101c39470 <__ZL16knifetool_finishP10wmOperator+0x54>
101c39498:     	ldp	x29, x30, [sp, #0x30]
101c3949c:     	ldp	x20, x19, [sp, #0x20]
101c394a0:     	ldp	x22, x21, [sp, #0x10]
101c394a4:     	add	sp, sp, #0x40
101c394a8:     	ret
