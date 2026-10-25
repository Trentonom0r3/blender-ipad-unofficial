
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c33df4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent>:
101c33df4:     	sub	sp, sp, #0x50
101c33df8:     	stp	x24, x23, [sp, #0x10]
101c33dfc:     	stp	x22, x21, [sp, #0x20]
101c33e00:     	stp	x20, x19, [sp, #0x30]
101c33e04:     	stp	x29, x30, [sp, #0x40]
101c33e08:     	add	x29, sp, #0x40
101c33e0c:     	mov	x22, x2
101c33e10:     	mov	x20, x1
101c33e14:     	mov	x19, x0
101c33e18:     	ldr	x21, [x1, #0x60]
101c33e1c:     	ldrsw	x8, [x21, #0x2d0]
101c33e20:     	cmn	w8, #0x1
101c33e24:     	b.eq	0x101c33e3c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x48>
101c33e28:     	ldr	x9, [x21, #0x80]
101c33e2c:     	add	x8, x9, x8, lsl #3
101c33e30:     	ldr	x0, [x8]
101c33e34:     	cbnz	x0, 0x101c33e48 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x54>
101c33e38:     	b	0x101c33ea4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xb0>
101c33e3c:     	add	x8, x21, #0x40
101c33e40:     	ldr	x0, [x8]
101c33e44:     	cbz	x0, 0x101c33ea4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xb0>
101c33e48:     	ldrh	w8, [x0, #0x1b0]
101c33e4c:     	cmp	w8, #0x1
101c33e50:     	b.ne	0x101c33ea4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xb0>
101c33e54:     	ldr	x8, [x21, #0x48]
101c33e58:     	str	x8, [x21]
101c33e5c:     	ldr	x1, [x21, #0x60]
101c33e60:     	bl	0x10222caa0 <__Z24ED_view3d_init_mats_rv3dPK6ObjectP12RegionView3D>
101c33e64:     	ldr	w8, [x21, #0x3a0]
101c33e68:     	cmp	w8, #0x3
101c33e6c:     	b.ne	0x101c33e78 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x84>
101c33e70:     	ldr	w8, [x21, #0x3a8]
101c33e74:     	str	w8, [x21, #0x3a0]
101c33e78:     	ldur	d0, [x22, #0x1c]
101c33e7c:     	scvtf.2s	v0, v0
101c33e80:     	str	d0, [sp]
101c33e84:     	ldrb	w8, [x21, #0x443]
101c33e88:     	cmp	w8, #0x1
101c33e8c:     	b.ne	0x101c33f4c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x158>
101c33e90:     	ldr	w8, [x21, #0x438]
101c33e94:     	cmp	w8, #0x3
101c33e98:     	b.lt	0x101c33ed8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xe4>
101c33e9c:     	str	wzr, [x21, #0x3d0]
101c33ea0:     	b	0x101c33ef4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x100>
101c33ea4:     	mov	x0, x21
101c33ea8:     	bl	0x101c37040 <__ZL17knifetool_exit_exP16KnifeTool_OpData>
101c33eac:     	str	xzr, [x20, #0x60]
101c33eb0:     	mov	x0, x19
101c33eb4:     	mov	x1, #0x0                ; =0
101c33eb8:     	bl	0x1016204dc <__Z24ED_workspace_status_textP8bContextPKc>
101c33ebc:     	mov	w0, #0x4                ; =4
101c33ec0:     	ldp	x29, x30, [sp, #0x40]
101c33ec4:     	ldp	x20, x19, [sp, #0x30]
101c33ec8:     	ldp	x22, x21, [sp, #0x20]
101c33ecc:     	ldp	x24, x23, [sp, #0x10]
101c33ed0:     	add	sp, sp, #0x50
101c33ed4:     	ret
101c33ed8:     	ldr	s0, [x21, #0x43c]
101c33edc:     	fmov	s1, #18.00000000
101c33ee0:     	fcmp	s0, s1
101c33ee4:     	b.le	0x101c33f10 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x11c>
101c33ee8:     	str	wzr, [x21, #0x3d0]
101c33eec:     	cmp	w8, #0x1
101c33ef0:     	b.lt	0x101c33f10 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x11c>
101c33ef4:     	add	x9, x21, #0x3f6
101c33ef8:     	sub	w8, w8, #0x1
101c33efc:     	strb	wzr, [x9, w8, uxtw]
101c33f00:     	ldr	w8, [x21, #0x438]
101c33f04:     	subs	w8, w8, #0x1
101c33f08:     	str	w8, [x21, #0x438]
101c33f0c:     	b.gt	0x101c33ef8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x104>
101c33f10:     	mov	x0, x19
101c33f14:     	mov	x1, x20
101c33f18:     	mov	x2, x21
101c33f1c:     	bl	0x101c37178 <__ZL19knife_update_headerP8bContextP10wmOperatorP16KnifeTool_OpData>
101c33f20:     	ldrh	w8, [x22, #0x12]
101c33f24:     	cmp	w8, #0x1
101c33f28:     	b.ne	0x101c33f4c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x158>
101c33f2c:     	add	x0, x21, #0x3b0
101c33f30:     	bl	0x102335b58 <__Z11hasNumInputPK8NumInput>
101c33f34:     	cbz	w0, 0x101c33f4c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x158>
101c33f38:     	add	x1, x21, #0x3b0
101c33f3c:     	mov	x0, x19
101c33f40:     	mov	x2, x22
101c33f44:     	bl	0x102335e50 <__Z14handleNumInputP8bContextP8NumInputPK7wmEvent>
101c33f48:     	cbnz	w0, 0x101c34454 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x660>
101c33f4c:     	ldrh	w8, [x22, #0x10]
101c33f50:     	mov	w0, #0x8                ; =8
101c33f54:     	cmp	w8, #0x10
101c33f58:     	b.hi	0x101c33fc4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x1d0>
101c33f5c:     	mov	w9, #0x1                ; =1
101c33f60:     	lsl	w9, w9, w8
101c33f64:     	mov	w10, #0xcc00            ; =52224
101c33f68:     	movk	w10, #0x1, lsl #16
101c33f6c:     	tst	w9, w10
101c33f70:     	b.ne	0x101c33ec0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xcc>
101c33f74:     	cmp	w8, #0x4
101c33f78:     	b.ne	0x101c33fc4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x1d0>
101c33f7c:     	ldr	w8, [x21, #0x3a0]
101c33f80:     	cmp	w8, #0x3
101c33f84:     	b.eq	0x101c340a8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x2b4>
101c33f88:     	mov	x1, sp
101c33f8c:     	mov	x0, x21
101c33f90:     	bl	0x101c35bc8 <__ZL21knifetool_update_mvalP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c33f94:     	ldrb	w8, [x21, #0x3a4]
101c33f98:     	cmp	w8, #0x1
101c33f9c:     	b.ne	0x101c33fb8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x1c4>
101c33fa0:     	ldp	x9, x8, [x21, #0x168]
101c33fa4:     	sub	x8, x8, x9
101c33fa8:     	cmp	x8, #0x49
101c33fac:     	b.lt	0x101c33fb8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x1c4>
101c33fb0:     	mov	x0, x21
101c33fb4:     	bl	0x101c35c18 <__ZL13knife_add_cutP16KnifeTool_OpData>
101c33fb8:     	mov	w8, #0x0                ; =0
101c33fbc:     	mov	w24, #0x1               ; =1
101c33fc0:     	b	0x101c343c8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d4>
101c33fc4:     	cmp	w8, #0x190
101c33fc8:     	b.eq	0x101c33ec0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xcc>
101c33fcc:     	mov	w9, #0x5022             ; =20514
101c33fd0:     	cmp	w8, w9
101c33fd4:     	b.ne	0x101c340a8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x2b4>
101c33fd8:     	mov	w24, #0x0               ; =0
101c33fdc:     	ldrh	w8, [x22, #0x12]
101c33fe0:     	sub	w8, w8, #0x1
101c33fe4:     	cmp	w8, #0x12
101c33fe8:     	b.hi	0x101c3436c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x578>
101c33fec:     	add	x23, x21, #0x2a8
101c33ff0:     	adrp	x9, 0x1051f2000 <__ZL7indices+0x9c>
101c33ff4:     	add	x9, x9, #0x9fa
101c33ff8:     	adr	x10, 0x101c3400c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x218>
101c33ffc:     	ldrb	w11, [x9, x8]
101c34000:     	add	x10, x10, x11, lsl #2
101c34004:     	mov	x8, x24
101c34008:     	br	x10
101c3400c:     	ldr	w22, [x21, #0x354]
101c34010:     	ldr	x0, [x21]
101c34014:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c34018:     	mov	x0, x20
101c3401c:     	bl	0x101c3941c <__ZL16knifetool_finishP10wmOperator>
101c34020:     	ldr	x0, [x20, #0x60]
101c34024:     	bl	0x101c37040 <__ZL17knifetool_exit_exP16KnifeTool_OpData>
101c34028:     	str	xzr, [x20, #0x60]
101c3402c:     	mov	x0, x19
101c34030:     	mov	x1, #0x0                ; =0
101c34034:     	bl	0x1016204dc <__Z24ED_workspace_status_textP8bContextPKc>
101c34038:     	cmp	w22, #0x0
101c3403c:     	mov	w8, #0x4                ; =4
101c34040:     	mov	w9, #0x2                ; =2
101c34044:     	csel	w0, w9, w8, eq
101c34048:     	b	0x101c33ec0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xcc>
101c3404c:     	ldrb	w8, [x21, #0x489]
101c34050:     	eor	w8, w8, #0x1
101c34054:     	strb	w8, [x21, #0x489]
101c34058:     	mov	w24, #0x1               ; =1
101c3405c:     	b	0x101c343c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d0>
101c34060:     	ldrb	w8, [x21, #0x443]
101c34064:     	cmp	w8, #0x1
101c34068:     	b.ne	0x101c340a8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x2b4>
101c3406c:     	ldrh	w8, [x21, #0x440]
101c34070:     	cmp	w8, #0x2
101c34074:     	b.ne	0x101c340a8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x2b4>
101c34078:     	ldr	w8, [x21, #0x450]
101c3407c:     	cbz	w8, 0x101c345f4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x800>
101c34080:     	ldr	w9, [x21, #0x454]
101c34084:     	add	w9, w9, #0x1
101c34088:     	sdiv	w10, w9, w8
101c3408c:     	msub	w8, w10, w8, w9
101c34090:     	str	w8, [x21, #0x454]
101c34094:     	add	x1, x21, #0x2d4
101c34098:     	mov	x0, x21
101c3409c:     	bl	0x101c396b0 <__ZL27knife_snap_update_from_mvalP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c340a0:     	mov	w24, #0x1               ; =1
101c340a4:     	b	0x101c343c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d0>
101c340a8:     	mov	w24, #0x0               ; =0
101c340ac:     	mov	w8, #0x0                ; =0
101c340b0:     	b	0x101c343c8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d4>
101c340b4:     	ldrh	w8, [x21, #0x460]
101c340b8:     	cmp	w8, #0x3
101c340bc:     	csinc	w8, wzr, w8, eq
101c340c0:     	strh	w8, [x21, #0x460]
101c340c4:     	tst	w8, #0xffff
101c340c8:     	cset	w8, ne
101c340cc:     	strb	w8, [x21, #0x462]
101c340d0:     	mov	w24, #0x1               ; =1
101c340d4:     	b	0x101c343c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d0>
101c340d8:     	ldr	x0, [x21, #0x150]
101c340dc:     	bl	0x1008193b0 <__Z18BLI_stack_is_emptyPK9BLI_Stack>
101c340e0:     	cbz	w0, 0x101c342ac <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x4b8>
101c340e4:     	ldr	x0, [x21]
101c340e8:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c340ec:     	b	0x101c34104 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x310>
101c340f0:     	ldrb	w23, [x21, #0x148]
101c340f4:     	ldr	x0, [x21]
101c340f8:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c340fc:     	cmp	w23, #0x1
101c34100:     	b.ne	0x101c34208 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x414>
101c34104:     	ldr	x0, [x20, #0x60]
101c34108:     	bl	0x101c37040 <__ZL17knifetool_exit_exP16KnifeTool_OpData>
101c3410c:     	str	xzr, [x20, #0x60]
101c34110:     	mov	x0, x19
101c34114:     	mov	x1, #0x0                ; =0
101c34118:     	bl	0x1016204dc <__Z24ED_workspace_status_textP8bContextPKc>
101c3411c:     	mov	w0, #0x2                ; =2
101c34120:     	b	0x101c33ec0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xcc>
101c34124:     	ldrb	w8, [x21, #0x384]
101c34128:     	eor	w8, w8, #0x1
101c3412c:     	strb	w8, [x21, #0x384]
101c34130:     	b	0x101c34338 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x544>
101c34134:     	add	x8, x21, #0x3ad
101c34138:     	mov	w9, #0x101              ; =257
101c3413c:     	strh	w9, [x8]
101c34140:     	mov	w24, #0x1               ; =1
101c34144:     	b	0x101c343c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d0>
101c34148:     	add	x8, x21, #0x3ad
101c3414c:     	strh	wzr, [x8]
101c34150:     	mov	w24, #0x1               ; =1
101c34154:     	b	0x101c343c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d0>
101c34158:     	ldr	w8, [x21, #0x3a0]
101c3415c:     	cmp	w8, #0x3
101c34160:     	b.eq	0x101c34170 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x37c>
101c34164:     	str	w8, [x21, #0x3a8]
101c34168:     	mov	w8, #0x3                ; =3
101c3416c:     	str	w8, [x21, #0x3a0]
101c34170:     	ldr	x0, [x21]
101c34174:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c34178:     	mov	w0, #0x8                ; =8
101c3417c:     	b	0x101c33ec0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xcc>
101c34180:     	ldr	w8, [x21, #0x3a0]
101c34184:     	cmp	w8, #0x1
101c34188:     	b.ne	0x101c343c0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5cc>
101c3418c:     	ldrb	w8, [x21, #0x3a4]
101c34190:     	cmp	w8, #0x1
101c34194:     	b.ne	0x101c341ac <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x3b8>
101c34198:     	strb	wzr, [x21, #0x3a4]
101c3419c:     	strb	wzr, [x21, #0x488]
101c341a0:     	add	x1, x21, #0x2d4
101c341a4:     	mov	x0, x21
101c341a8:     	bl	0x101c35bc8 <__ZL21knifetool_update_mvalP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c341ac:     	ldp	q0, q1, [x23]
101c341b0:     	stp	q0, q1, [x21, #0x2e0]
101c341b4:     	ldr	q0, [x23, #0x20]
101c341b8:     	str	q0, [x21, #0x300]
101c341bc:     	ldr	x8, [x23, #0x30]
101c341c0:     	str	x8, [x21, #0x310]
101c341c4:     	add	x8, x21, #0x318
101c341c8:     	ldr	x9, [x21, #0x348]
101c341cc:     	str	x9, [x23, #0x30]
101c341d0:     	ldp	q0, q1, [x8]
101c341d4:     	stp	q0, q1, [x23]
101c341d8:     	ldr	q0, [x8, #0x20]
101c341dc:     	str	q0, [x23, #0x20]
101c341e0:     	ldr	x0, [x21]
101c341e4:     	add	x2, x21, #0x2d4
101c341e8:     	mov	x1, x23
101c341ec:     	mov	w3, #0x0                ; =0
101c341f0:     	bl	0x102263bbc <__Z30ED_view3d_project_float_globalPK7ARegionPKfPf12eV3DProjTest>
101c341f4:     	add	x1, x21, #0x2d4
101c341f8:     	mov	x0, x21
101c341fc:     	bl	0x101c35bc8 <__ZL21knifetool_update_mvalP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c34200:     	mov	x0, x21
101c34204:     	bl	0x101c35c18 <__ZL13knife_add_cutP16KnifeTool_OpData>
101c34208:     	ldr	x0, [x21, #0x168]
101c3420c:     	add	x23, x21, #0x180
101c34210:     	cmp	x0, x23
101c34214:     	b.eq	0x101c3421c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x428>
101c34218:     	bl	0x100ae425c <_MEM_freeN>
101c3421c:     	mov	w24, #0x0               ; =0
101c34220:     	stp	x23, x23, [x21, #0x168]
101c34224:     	add	x8, x21, #0x2a0
101c34228:     	str	x8, [x21, #0x178]
101c3422c:     	str	wzr, [x21, #0x3a0]
101c34230:     	b	0x101c343c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d0>
101c34234:     	mov	w24, #0x1               ; =1
101c34238:     	strb	w24, [x21, #0x3ac]
101c3423c:     	mov	x0, x21
101c34240:     	bl	0x101c35b08 <__ZL18knife_recalc_orthoP16KnifeTool_OpData>
101c34244:     	mov	x1, sp
101c34248:     	mov	x0, x21
101c3424c:     	bl	0x101c37e9c <__ZL19knife_update_activeP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c34250:     	b	0x101c343c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d0>
101c34254:     	strb	wzr, [x21, #0x3ac]
101c34258:     	mov	x0, x21
101c3425c:     	bl	0x101c35b08 <__ZL18knife_recalc_orthoP16KnifeTool_OpData>
101c34260:     	b	0x101c34338 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x544>
101c34264:     	ldrh	w8, [x21, #0x440]
101c34268:     	cmp	w8, #0x2
101c3426c:     	b.ne	0x101c342c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x4d0>
101c34270:     	mov	w8, #0x0                ; =0
101c34274:     	b	0x101c342d0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x4dc>
101c34278:     	strb	wzr, [x21, #0x148]
101c3427c:     	mov	x0, x21
101c34280:     	bl	0x101c35b08 <__ZL18knife_recalc_orthoP16KnifeTool_OpData>
101c34284:     	ldrh	w8, [x22, #0x92]
101c34288:     	cmp	w8, #0x2
101c3428c:     	b.ne	0x101c3434c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x558>
101c34290:     	strb	wzr, [x21, #0x3a4]
101c34294:     	strb	wzr, [x21, #0x3ad]
101c34298:     	strb	wzr, [x21, #0x488]
101c3429c:     	add	x1, x21, #0x2d4
101c342a0:     	mov	x0, x21
101c342a4:     	bl	0x101c35bc8 <__ZL21knifetool_update_mvalP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c342a8:     	b	0x101c343b8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5c4>
101c342ac:     	mov	x0, x21
101c342b0:     	bl	0x101c394ac <__ZL14knifetool_undoP16KnifeTool_OpData>
101c342b4:     	mov	x1, sp
101c342b8:     	mov	x0, x21
101c342bc:     	bl	0x101c37e9c <__ZL19knife_update_activeP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c342c0:     	b	0x101c343b8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5c4>
101c342c4:     	add	w8, w8, #0x1
101c342c8:     	movi.16b	v0, #0x0
101c342cc:     	str	d0, [x21, #0x450]
101c342d0:     	strh	w8, [x21, #0x440]
101c342d4:     	tst	w8, #0xffff
101c342d8:     	cset	w8, ne
101c342dc:     	strb	w8, [x21, #0x443]
101c342e0:     	ldr	x0, [x20, #0x70]
101c342e4:     	adrp	x1, 0x104d2c000 <__ZL3hex+0x16034d>
101c342e8:     	add	x1, x1, #0xfd9
101c342ec:     	bl	0x10125d4e0 <__Z13RNA_float_getP10PointerRNAPKc>
101c342f0:     	mov	w8, #0x2ee1             ; =12001
101c342f4:     	movk	w8, #0x4265, lsl #16
101c342f8:     	fmov	s1, w8
101c342fc:     	fmul	s0, s0, s1
101c34300:     	str	s0, [x21, #0x43c]
101c34304:     	str	wzr, [x21, #0x458]
101c34308:     	strb	wzr, [x21, #0x45c]
101c3430c:     	str	wzr, [x21, #0x3d0]
101c34310:     	ldr	w8, [x21, #0x438]
101c34314:     	cmp	w8, #0x1
101c34318:     	b.lt	0x101c34338 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x544>
101c3431c:     	add	x9, x21, #0x3f6
101c34320:     	sub	w8, w8, #0x1
101c34324:     	strb	wzr, [x9, w8, uxtw]
101c34328:     	ldr	w8, [x21, #0x438]
101c3432c:     	subs	w8, w8, #0x1
101c34330:     	str	w8, [x21, #0x438]
101c34334:     	b.gt	0x101c34320 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x52c>
101c34338:     	mov	x1, sp
101c3433c:     	mov	x0, x21
101c34340:     	bl	0x101c37e9c <__ZL19knife_update_activeP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c34344:     	mov	w24, #0x1               ; =1
101c34348:     	b	0x101c343c4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d0>
101c3434c:     	ldr	w8, [x21, #0x3a0]
101c34350:     	cmp	w8, #0x3
101c34354:     	b.eq	0x101c343a4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5b0>
101c34358:     	cmp	w8, #0x1
101c3435c:     	b.ne	0x101c34374 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x580>
101c34360:     	mov	x0, x21
101c34364:     	bl	0x101c35c18 <__ZL13knife_add_cutP16KnifeTool_OpData>
101c34368:     	b	0x101c343a4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5b0>
101c3436c:     	mov	x8, x24
101c34370:     	b	0x101c343c8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d4>
101c34374:     	mov	x1, sp
101c34378:     	mov	x0, x21
101c3437c:     	bl	0x101c35b44 <__ZL15knife_start_cutP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c34380:     	mov	w8, #0x1                ; =1
101c34384:     	str	w8, [x21, #0x3a0]
101c34388:     	add	x8, x21, #0x318
101c3438c:     	ldp	q0, q1, [x23]
101c34390:     	stp	q0, q1, [x8]
101c34394:     	ldr	q0, [x23, #0x20]
101c34398:     	str	q0, [x8, #0x20]
101c3439c:     	ldr	x8, [x23, #0x30]
101c343a0:     	str	x8, [x21, #0x348]
101c343a4:     	ldrb	w8, [x21, #0x384]
101c343a8:     	tbnz	w8, #0x0, 0x101c343b8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5c4>
101c343ac:     	mov	w8, #0x1                ; =1
101c343b0:     	strb	w8, [x21, #0x3a4]
101c343b4:     	strb	w8, [x21, #0x3ad]
101c343b8:     	ldr	x0, [x21]
101c343bc:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c343c0:     	mov	w24, #0x0               ; =0
101c343c4:     	mov	w8, #0x1                ; =1
101c343c8:     	ldrb	w9, [x21, #0x443]
101c343cc:     	cmp	w9, #0x1
101c343d0:     	b.ne	0x101c344a4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x6b0>
101c343d4:     	ldr	w9, [x21, #0x438]
101c343d8:     	cmp	w9, #0x3
101c343dc:     	b.lt	0x101c343e8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5f4>
101c343e0:     	str	wzr, [x21, #0x3d0]
101c343e4:     	b	0x101c34404 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x610>
101c343e8:     	ldr	s0, [x21, #0x43c]
101c343ec:     	fmov	s1, #18.00000000
101c343f0:     	fcmp	s0, s1
101c343f4:     	b.le	0x101c34420 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x62c>
101c343f8:     	str	wzr, [x21, #0x3d0]
101c343fc:     	cmp	w9, #0x1
101c34400:     	b.lt	0x101c34420 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x62c>
101c34404:     	add	x10, x21, #0x3f6
101c34408:     	sub	w9, w9, #0x1
101c3440c:     	strb	wzr, [x10, w9, uxtw]
101c34410:     	ldr	w9, [x21, #0x438]
101c34414:     	subs	w9, w9, #0x1
101c34418:     	str	w9, [x21, #0x438]
101c3441c:     	b.gt	0x101c34408 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x614>
101c34420:     	ldrh	w9, [x22, #0x10]
101c34424:     	mov	w10, #0x5022            ; =20514
101c34428:     	cmp	w9, w10
101c3442c:     	csinc	w8, w8, wzr, ne
101c34430:     	tbnz	w8, #0x0, 0x101c344a8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x6b4>
101c34434:     	ldrh	w8, [x22, #0x12]
101c34438:     	cmp	w8, #0x1
101c3443c:     	b.ne	0x101c344a4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x6b0>
101c34440:     	add	x1, x21, #0x3b0
101c34444:     	mov	x0, x19
101c34448:     	mov	x2, x22
101c3444c:     	bl	0x102335e50 <__Z14handleNumInputP8bContextP8NumInputPK7wmEvent>
101c34450:     	cbz	w0, 0x101c344a4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x6b0>
101c34454:     	add	x0, x21, #0x3b0
101c34458:     	add	x1, sp, #0xc
101c3445c:     	bl	0x102335ba4 <__Z13applyNumInputP8NumInputPf>
101c34460:     	ldr	s0, [sp, #0xc]
101c34464:     	fcmp	s0, #0.0
101c34468:     	mov	w8, #0x43340000         ; =1127481344
101c3446c:     	fmov	s1, w8
101c34470:     	fccmp	s0, s1, #0x2, gt
101c34474:     	b.hi	0x101c3447c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x688>
101c34478:     	str	s0, [x21, #0x43c]
101c3447c:     	mov	x1, sp
101c34480:     	mov	x0, x21
101c34484:     	bl	0x101c37e9c <__ZL19knife_update_activeP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c34488:     	mov	x0, x19
101c3448c:     	mov	x1, x20
101c34490:     	mov	x2, x21
101c34494:     	bl	0x101c37178 <__ZL19knife_update_headerP8bContextP10wmOperatorP16KnifeTool_OpData>
101c34498:     	ldr	x0, [x21]
101c3449c:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c344a0:     	b	0x101c345ec <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x7f8>
101c344a4:     	ldrh	w9, [x22, #0x10]
101c344a8:     	mov	w8, #0x5022             ; =20514
101c344ac:     	cmp	w9, w8
101c344b0:     	b.ne	0x101c344f0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x6fc>
101c344b4:     	ldrh	w9, [x22, #0x12]
101c344b8:     	sub	w8, w9, #0x10
101c344bc:     	cmp	w8, #0x2
101c344c0:     	b.hi	0x101c344f0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x6fc>
101c344c4:     	ldrh	w8, [x21, #0x458]
101c344c8:     	cmp	w9, #0x11
101c344cc:     	b.eq	0x101c34514 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x720>
101c344d0:     	cmp	w9, #0x10
101c344d4:     	b.ne	0x101c34530 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x73c>
101c344d8:     	cmp	w8, #0x1
101c344dc:     	b.eq	0x101c34538 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x744>
101c344e0:     	mov	w8, #0x10001            ; =65537
101c344e4:     	str	w8, [x21, #0x458]
101c344e8:     	mov	w8, #0x58               ; =88
101c344ec:     	b	0x101c34574 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x780>
101c344f0:     	ldr	w8, [x21, #0x3a0]
101c344f4:     	cmp	w8, #0x1
101c344f8:     	cset	w8, ne
101c344fc:     	ldrh	w9, [x20, #0xa0]
101c34500:     	and	w9, w9, #0xffffffef
101c34504:     	orr	w8, w9, w8, lsl #4
101c34508:     	strh	w8, [x20, #0xa0]
101c3450c:     	cbnz	w24, 0x101c345d4 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x7e0>
101c34510:     	b	0x101c345ec <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x7f8>
101c34514:     	cmp	w8, #0x2
101c34518:     	b.eq	0x101c34538 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x744>
101c3451c:     	mov	w8, #0x2                ; =2
101c34520:     	movk	w8, #0x1, lsl #16
101c34524:     	str	w8, [x21, #0x458]
101c34528:     	mov	w8, #0x59               ; =89
101c3452c:     	b	0x101c34574 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x780>
101c34530:     	cmp	w8, #0x3
101c34534:     	b.ne	0x101c34564 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x770>
101c34538:     	ldrh	w8, [x21, #0x45a]
101c3453c:     	cmp	w8, #0x2
101c34540:     	b.ne	0x101c34550 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x75c>
101c34544:     	mov	w8, #0x0                ; =0
101c34548:     	str	wzr, [x21, #0x458]
101c3454c:     	b	0x101c3457c <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x788>
101c34550:     	add	w8, w8, #0x1
101c34554:     	strh	w8, [x21, #0x45a]
101c34558:     	ldrb	w8, [x21, #0x45d]
101c3455c:     	add	w8, w8, #0x20
101c34560:     	b	0x101c34574 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x780>
101c34564:     	mov	w8, #0x3                ; =3
101c34568:     	movk	w8, #0x1, lsl #16
101c3456c:     	str	w8, [x21, #0x458]
101c34570:     	mov	w8, #0x5a               ; =90
101c34574:     	strb	w8, [x21, #0x45d]
101c34578:     	mov	w8, #0x1                ; =1
101c3457c:     	strb	w8, [x21, #0x45c]
101c34580:     	str	wzr, [x21, #0x440]
101c34584:     	ldr	x0, [x21, #0x20]
101c34588:     	ldr	x1, [x21, #0x50]
101c3458c:     	ldr	x2, [x21, #0x60]
101c34590:     	add	x4, x21, #0x398
101c34594:     	add	x5, x21, #0x39c
101c34598:     	mov	w3, #0x1                ; =1
101c3459c:     	bl	0x102275a04 <__Z24ED_view3d_clip_range_getPK9DepsgraphPK6View3DPK12RegionView3DbPfS8_>
101c345a0:     	strb	w0, [x21, #0x387]
101c345a4:     	mov	x1, sp
101c345a8:     	mov	x0, x21
101c345ac:     	bl	0x101c37e9c <__ZL19knife_update_activeP16KnifeTool_OpDataRKN7blender7VecBaseIfLi2EEE>
101c345b0:     	ldr	x0, [x21]
101c345b4:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c345b8:     	ldr	w8, [x21, #0x3a0]
101c345bc:     	cmp	w8, #0x1
101c345c0:     	cset	w8, ne
101c345c4:     	ldrh	w9, [x20, #0xa0]
101c345c8:     	and	w9, w9, #0xffffffef
101c345cc:     	orr	w8, w9, w8, lsl #4
101c345d0:     	strh	w8, [x20, #0xa0]
101c345d4:     	ldr	x0, [x21]
101c345d8:     	bl	0x10161e0fc <__Z20ED_region_tag_redrawP7ARegion>
101c345dc:     	mov	x0, x19
101c345e0:     	mov	x1, x20
101c345e4:     	mov	x2, x21
101c345e8:     	bl	0x101c37178 <__ZL19knife_update_headerP8bContextP10wmOperatorP16KnifeTool_OpData>
101c345ec:     	mov	w0, #0x1                ; =1
101c345f0:     	b	0x101c33ec0 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0xcc>
101c345f4:     	mov	w24, #0x0               ; =0
101c345f8:     	b	0x101c343c8 <__ZL15knifetool_modalP8bContextP10wmOperatorPK7wmEvent+0x5d4>
