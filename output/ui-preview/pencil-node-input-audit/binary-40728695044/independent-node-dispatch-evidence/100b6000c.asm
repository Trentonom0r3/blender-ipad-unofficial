
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b6000c <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i>:
100b6000c:     	ldrb	w8, [x0, #0x74]
100b60010:     	cbnz	w8, 0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b60014:     	ldr	x8, [x0, #0xf8]
100b60018:     	cbnz	x8, 0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b6001c:     	ldr	x8, [x0, #0x100]
100b60020:     	cbnz	x8, 0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b60024:     	ldr	x8, [x0, #0x108]
100b60028:     	cbnz	x8, 0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b6002c:     	ldr	x8, [x0, #0x20]
100b60030:     	cbnz	x8, 0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b60034:     	ldr	x8, [x0, #0x28]
100b60038:     	cbnz	x8, 0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b6003c:     	ldrsh	w8, [x0, #0xf4]
100b60040:     	cmp	w1, #0x0
100b60044:     	mov	w9, #-0x4d              ; =-77
100b60048:     	mov	w10, #-0xf              ; =-15
100b6004c:     	csel	w9, w10, w9, ne
100b60050:     	tst	w9, w8
100b60054:     	b.ne	0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b60058:     	and	w8, w8, #0x2
100b6005c:     	cmp	w1, #0x0
100b60060:     	mov	w9, #0x2                ; =2
100b60064:     	csel	w9, w9, wzr, ne
100b60068:     	cmp	w8, w9
100b6006c:     	b.ne	0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b60070:     	ldrsh	w8, [x0, #0xf6]
100b60074:     	cmp	w8, #0x1
100b60078:     	b.lt	0x100b602e0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2d4>
100b6007c:     	sub	sp, sp, #0x70
100b60080:     	stp	x28, x27, [sp, #0x10]
100b60084:     	stp	x26, x25, [sp, #0x20]
100b60088:     	stp	x24, x23, [sp, #0x30]
100b6008c:     	stp	x22, x21, [sp, #0x40]
100b60090:     	stp	x20, x19, [sp, #0x50]
100b60094:     	stp	x29, x30, [sp, #0x60]
100b60098:     	add	x29, sp, #0x60
100b6009c:     	mov	x20, #0x0               ; =0
100b600a0:     	mov	x8, #0x0                ; =0
100b600a4:     	ldr	x9, [x0, #0x10]
100b600a8:     	mov	w10, #-0x1              ; =-1
100b600ac:     	str	w10, [x3]
100b600b0:     	cmp	w1, #0x0
100b600b4:     	mov	w10, #0xf5              ; =245
100b600b8:     	mov	w11, #0xfd              ; =253
100b600bc:     	csel	w10, w11, w10, ne
100b600c0:     	str	w10, [sp, #0xc]
100b600c4:     	adrp	x10, 0x1063a5000 <_IMB_FILE_TYPES+0x58>
100b600c8:     	add	x10, x10, #0xf00
100b600cc:     	cbz	x9, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b600d0:     	mov	x25, x9
100b600d4:     	ldr	x9, [x9, #0x8]
100b600d8:     	cmp	x9, x8
100b600dc:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b600e0:     	ldrsh	w22, [x25, #0xae]
100b600e4:     	cmp	w22, #0x1
100b600e8:     	b.lt	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b600ec:     	ldrsh	w8, [x0, #0xf6]
100b600f0:     	cmp	w22, w8
100b600f4:     	b.gt	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b600f8:     	mov	x28, x2
100b600fc:     	mov	x23, x3
100b60100:     	mov	x27, x4
100b60104:     	mov	x26, x0
100b60108:     	mov	w8, #0x28               ; =40
100b6010c:     	mov	x21, x10
100b60110:     	madd	x24, x20, x8, x10
100b60114:     	ldr	x19, [x24]
100b60118:     	add	x0, x25, #0x10
100b6011c:     	mov	x1, x19
100b60120:     	bl	0x100b602f8 <__ZL29wm_ipad_node_view2d_string_isPKcmS0_>
100b60124:     	cbz	w0, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60128:     	ldrsh	w8, [x25, #0x9a]
100b6012c:     	ldr	w9, [x24, #0x8]
100b60130:     	cmp	w9, w8
100b60134:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60138:     	ldrsb	w9, [x25, #0x9c]
100b6013c:     	ldr	w10, [x24, #0xc]
100b60140:     	cmp	w10, w9
100b60144:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60148:     	ldrb	w9, [x25, #0x9d]
100b6014c:     	cmp	w9, #0xff
100b60150:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60154:     	ldrsb	w9, [x25, #0x9e]
100b60158:     	ldr	w10, [x24, #0x10]
100b6015c:     	cmp	w10, w9
100b60160:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60164:     	ldrsb	w9, [x25, #0x9f]
100b60168:     	ldr	w10, [x24, #0x14]
100b6016c:     	cmp	w10, w9
100b60170:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60174:     	ldrsb	w9, [x25, #0xa0]
100b60178:     	ldr	w10, [x24, #0x18]
100b6017c:     	cmp	w10, w9
100b60180:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60184:     	ldrsb	w9, [x25, #0xa1]
100b60188:     	ldr	w10, [x24, #0x1c]
100b6018c:     	cmp	w10, w9
100b60190:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60194:     	ldrsb	w9, [x25, #0xa2]
100b60198:     	ldr	w10, [x24, #0x20]
100b6019c:     	cmp	w10, w9
100b601a0:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b601a4:     	ldrh	w9, [x25, #0xaa]
100b601a8:     	cbnz	w9, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b601ac:     	ldrb	w9, [x25, #0xad]
100b601b0:     	cbnz	w9, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b601b4:     	ldrh	w9, [x25, #0x98]
100b601b8:     	cbnz	w9, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b601bc:     	ldrb	w9, [x25, #0x58]
100b601c0:     	cbnz	w9, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b601c4:     	ldrb	w9, [x25, #0xac]
100b601c8:     	ldr	w10, [sp, #0xc]
100b601cc:     	and	w9, w10, w9
100b601d0:     	ldr	w10, [x24, #0x24]
100b601d4:     	cmp	w9, w10
100b601d8:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b601dc:     	mov	x8, x27
100b601e0:     	cbz	x20, 0x100b60200 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x1f4>
100b601e4:     	mov	x9, #0x0                ; =0
100b601e8:     	ldr	w10, [x8, x9, lsl #2]
100b601ec:     	cmp	w10, w22
100b601f0:     	b.eq	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b601f4:     	add	x9, x9, #0x1
100b601f8:     	cmp	x20, x9
100b601fc:     	b.ne	0x100b601e8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x1dc>
100b60200:     	str	w22, [x8, x20, lsl #2]
100b60204:     	ldr	x24, [x25, #0x50]
100b60208:     	ldr	x22, [x25, #0xb0]
100b6020c:     	mov	x0, x19
100b60210:     	mov	w1, #0x1                ; =1
100b60214:     	bl	0x100b7d198 <__Z20WM_operatortype_findPKcb>
100b60218:     	cbz	x0, 0x100b60224 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x218>
100b6021c:     	ldr	x9, [x0, #0x88]
100b60220:     	b	0x100b6022c <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x220>
100b60224:     	adrp	x9, 0x106bc2000 <__ZL26rna_Operator_modal_result_+0xc8>
100b60228:     	add	x9, x9, #0x698
100b6022c:     	mov	x0, x26
100b60230:     	mov	x3, x23
100b60234:     	mov	x2, x28
100b60238:     	cbz	x24, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b6023c:     	ldrb	w8, [x24, #0x10]
100b60240:     	cmp	w8, #0x6
100b60244:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60248:     	ldr	w8, [x24, #0x78]
100b6024c:     	cbnz	w8, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60250:     	ldr	x8, [x24, #0x60]
100b60254:     	cbnz	x8, 0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60258:     	ldr	x10, [x24, #0x68]
100b6025c:     	cbnz	x10, 0x100b602bc <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2b0>
100b60260:     	cbz	x22, 0x100b602bc <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2b0>
100b60264:     	ldr	x8, [x22, #0x10]
100b60268:     	cmp	x8, x24
100b6026c:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b60270:     	mov	w8, #0x0                ; =0
100b60274:     	ldr	x10, [x22]
100b60278:     	cbnz	x10, 0x100b602bc <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2b0>
100b6027c:     	cbz	x9, 0x100b602bc <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2b0>
100b60280:     	ldr	x8, [x22, #0x8]
100b60284:     	cmp	x8, x9
100b60288:     	b.ne	0x100b602b8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2ac>
100b6028c:     	mov	x4, x27
100b60290:     	cmp	x25, x2
100b60294:     	mov	x10, x21
100b60298:     	b.ne	0x100b602a0 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x294>
100b6029c:     	str	w20, [x3]
100b602a0:     	ldr	x9, [x25]
100b602a4:     	add	x20, x20, #0x1
100b602a8:     	mov	x8, x25
100b602ac:     	cmp	x20, #0x19
100b602b0:     	b.ne	0x100b600cc <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0xc0>
100b602b4:     	cbz	x9, 0x100b602e8 <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2dc>
100b602b8:     	mov	w8, #0x0                ; =0
100b602bc:     	ldp	x29, x30, [sp, #0x60]
100b602c0:     	ldp	x20, x19, [sp, #0x50]
100b602c4:     	ldp	x22, x21, [sp, #0x40]
100b602c8:     	ldp	x24, x23, [sp, #0x30]
100b602cc:     	ldp	x26, x25, [sp, #0x20]
100b602d0:     	ldp	x28, x27, [sp, #0x10]
100b602d4:     	add	sp, sp, #0x70
100b602d8:     	mov	x0, x8
100b602dc:     	ret
100b602e0:     	mov	w0, #0x0                ; =0
100b602e4:     	ret
100b602e8:     	ldr	x8, [x26, #0x18]
100b602ec:     	cmp	x8, x25
100b602f0:     	cset	w8, eq
100b602f4:     	b	0x100b602bc <__ZL26wm_ipad_node_view2d_map_isPK8wmKeyMapbPK12wmKeyMapItemPiRA25_i+0x2b0>
