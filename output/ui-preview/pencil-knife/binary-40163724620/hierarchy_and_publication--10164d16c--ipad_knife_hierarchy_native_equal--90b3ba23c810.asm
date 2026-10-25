
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010164d16c <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_>:
10164d16c:     	ldp	x8, x9, [x0]
10164d170:     	ldp	x10, x11, [x1]
10164d174:     	ldp	x12, x13, [x0, #0x10]
10164d178:     	ldp	x14, x15, [x1, #0x10]
10164d17c:     	ldp	x16, x17, [x0, #0x20]
10164d180:     	ldp	x2, x3, [x1, #0x20]
10164d184:     	ldr	x4, [x0, #0x30]
10164d188:     	ldr	x5, [x1, #0x30]
10164d18c:     	cmp	x8, x10
10164d190:     	ccmp	x9, x11, #0x0, eq
10164d194:     	ccmp	x12, x14, #0x0, eq
10164d198:     	ccmp	x13, x15, #0x0, eq
10164d19c:     	ccmp	x16, x2, #0x0, eq
10164d1a0:     	ccmp	x17, x3, #0x0, eq
10164d1a4:     	ccmp	x4, x5, #0x0, eq
10164d1a8:     	b.ne	0x10164d240 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xd4>
10164d1ac:     	ldr	w8, [x0, #0x38]
10164d1b0:     	ldr	w9, [x1, #0x38]
10164d1b4:     	cmp	w8, w9
10164d1b8:     	b.ne	0x10164d240 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xd4>
10164d1bc:     	ldr	w8, [x0, #0x3c]
10164d1c0:     	ldr	w9, [x1, #0x3c]
10164d1c4:     	cmp	w8, w9
10164d1c8:     	b.ne	0x10164d240 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xd4>
10164d1cc:     	ldr	s0, [x0, #0x40]
10164d1d0:     	ldr	s1, [x1, #0x40]
10164d1d4:     	fcmp	s0, s1
10164d1d8:     	b.ne	0x10164d240 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xd4>
10164d1dc:     	stp	x22, x21, [sp, #-0x30]!
10164d1e0:     	stp	x20, x19, [sp, #0x10]
10164d1e4:     	stp	x29, x30, [sp, #0x20]
10164d1e8:     	add	x29, sp, #0x20
10164d1ec:     	ldp	x19, x21, [x0, #0x48]
10164d1f0:     	sub	x8, x21, x19
10164d1f4:     	ldp	x20, x9, [x1, #0x48]
10164d1f8:     	sub	x9, x9, x20
10164d1fc:     	cmp	x8, x9
10164d200:     	b.ne	0x10164d248 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xdc>
10164d204:     	cmp	x19, x21
10164d208:     	b.eq	0x10164d250 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xe4>
10164d20c:     	mov	x0, x19
10164d210:     	mov	x1, x20
10164d214:     	mov	w2, #0xc0               ; =192
10164d218:     	bl	0x104b72368 <_zlibVersion+0x104b72368>
10164d21c:     	mov	x8, x0
10164d220:     	cmp	w0, #0x0
10164d224:     	cset	w0, eq
10164d228:     	cbnz	w8, 0x10164d254 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xe8>
10164d22c:     	add	x19, x19, #0xc0
10164d230:     	add	x20, x20, #0xc0
10164d234:     	cmp	x19, x21
10164d238:     	b.ne	0x10164d20c <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xa0>
10164d23c:     	b	0x10164d254 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xe8>
10164d240:     	mov	w0, #0x0                ; =0
10164d244:     	ret
10164d248:     	mov	w0, #0x0                ; =0
10164d24c:     	b	0x10164d254 <__ZN12_GLOBAL__N_133ipad_knife_hierarchy_native_equalERKNS_24IPadKnifeHierarchyNativeES2_+0xe8>
10164d250:     	mov	w0, #0x1                ; =1
10164d254:     	ldp	x29, x30, [sp, #0x20]
10164d258:     	ldp	x20, x19, [sp, #0x10]
10164d25c:     	ldp	x22, x21, [sp], #0x30
10164d260:     	ret
