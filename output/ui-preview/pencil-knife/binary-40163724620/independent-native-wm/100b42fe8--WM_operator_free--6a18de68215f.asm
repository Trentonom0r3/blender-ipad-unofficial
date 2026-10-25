
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b42fe8 <__Z16WM_operator_freeP10wmOperator>:
100b42fe8:     	sub	sp, sp, #0x30
100b42fec:     	stp	x20, x19, [sp, #0x10]
100b42ff0:     	stp	x29, x30, [sp, #0x20]
100b42ff4:     	add	x29, sp, #0x20
100b42ff8:     	str	x0, [sp, #0x8]
100b42ffc:     	adrp	x0, 0x107ef3000 <__ZN7blender3seqL10g_font_mapE+0x1b8>
100b43000:     	add	x0, x0, #0x320
100b43004:     	add	x1, sp, #0x8
100b43008:     	bl	0x100b43cfc <__ZNSt3__112__hash_tableIPN7nanovdb10HostBufferENS_4hashIS3_EENS_8equal_toIS3_EENS_9allocatorIS3_EEE14__erase_uniqueIS3_EEmRKT_>
100b4300c:     	ldr	x0, [sp, #0x8]
100b43010:     	bl	0x101c26478 <__Z24EDBM_touch_bevel_discardP10wmOperator>
100b43014:     	ldr	x0, [sp, #0x8]
100b43018:     	ldr	x8, [x0, #0x58]
100b4301c:     	cbz	x8, 0x100b43030 <__Z16WM_operator_freeP10wmOperator+0x48>
100b43020:     	ldrh	w8, [x8, #0xe4]
100b43024:     	tbz	w8, #0x3, 0x100b43030 <__Z16WM_operator_freeP10wmOperator+0x48>
100b43028:     	bl	0x100b7cd88 <__Z31wm_operator_macro_discard_touchP10wmOperator>
100b4302c:     	ldr	x0, [sp, #0x8]
100b43030:     	ldr	x8, [x0, #0x68]
100b43034:     	cbz	x8, 0x100b43044 <__Z16WM_operator_freeP10wmOperator+0x5c>
100b43038:     	mov	x0, x8
100b4303c:     	bl	0x1014fbc6c <__Z25BPY_DECREF_RNA_INVALIDATEPv>
100b43040:     	ldr	x0, [sp, #0x8]
100b43044:     	ldr	x19, [x0, #0x70]
100b43048:     	adrp	x20, 0x106657000 <__ZZN7blender3gpu13ProfileReport3getEvE9singleton+0x318>
100b4304c:     	add	x20, x20, #0x690
100b43050:     	cbz	x19, 0x100b43084 <__Z16WM_operator_freeP10wmOperator+0x9c>
100b43054:     	ldr	x8, [x19, #0x10]
100b43058:     	str	x8, [x0, #0x50]
100b4305c:     	ldr	x0, [x19, #0x18]
100b43060:     	add	x8, x19, #0x30
100b43064:     	cmp	x0, x8
100b43068:     	b.eq	0x100b43070 <__Z16WM_operator_freeP10wmOperator+0x88>
100b4306c:     	bl	0x100ae425c <_MEM_freeN>
100b43070:     	ldr	x8, [x20]
100b43074:     	mov	x0, x19
100b43078:     	mov	w1, #0x1                ; =1
100b4307c:     	blr	x8
100b43080:     	ldr	x0, [sp, #0x8]
100b43084:     	ldr	x8, [x0, #0x50]
100b43088:     	cbz	x8, 0x100b43098 <__Z16WM_operator_freeP10wmOperator+0xb0>
100b4308c:     	mov	x0, x8
100b43090:     	bl	0x1001f2354 <__Z16IDP_FreePropertyP10IDProperty>
100b43094:     	ldr	x0, [sp, #0x8]
100b43098:     	ldr	x8, [x0, #0x78]
100b4309c:     	cbz	x8, 0x100b430c8 <__Z16WM_operator_freeP10wmOperator+0xe0>
100b430a0:     	ldrb	w9, [x8, #0x18]
100b430a4:     	tbz	w9, #0x2, 0x100b430c8 <__Z16WM_operator_freeP10wmOperator+0xe0>
100b430a8:     	mov	x0, x8
100b430ac:     	bl	0x1003ca28c <__Z16BKE_reports_freeP10ReportList>
100b430b0:     	ldr	x8, [sp, #0x8]
100b430b4:     	ldr	x0, [x8, #0x78]
100b430b8:     	ldr	x8, [x20]
100b430bc:     	mov	w1, #0x0                ; =0
100b430c0:     	blr	x8
100b430c4:     	ldr	x0, [sp, #0x8]
100b430c8:     	ldr	x9, [x0, #0x80]
100b430cc:     	cbz	x9, 0x100b430e8 <__Z16WM_operator_freeP10wmOperator+0x100>
100b430d0:     	mov	x0, x9
100b430d4:     	ldr	x19, [x0]
100b430d8:     	bl	0x100b42fe8 <__Z16WM_operator_freeP10wmOperator>
100b430dc:     	mov	x0, x19
100b430e0:     	cbnz	x19, 0x100b430d4 <__Z16WM_operator_freeP10wmOperator+0xec>
100b430e4:     	ldr	x0, [sp, #0x8]
100b430e8:     	ldr	x8, [x20]
100b430ec:     	mov	w1, #0x0                ; =0
100b430f0:     	blr	x8
100b430f4:     	ldp	x29, x30, [sp, #0x20]
100b430f8:     	ldp	x20, x19, [sp, #0x10]
100b430fc:     	add	sp, sp, #0x30
100b43100:     	ret
100b43104:     	bl	0x1000144bc <___clang_call_terminate>
