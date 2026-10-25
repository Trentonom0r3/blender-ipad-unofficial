
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100b48214 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti>:
100b48214:     	sub	sp, sp, #0xb0
100b48218:     	stp	x28, x27, [sp, #0x50]
100b4821c:     	stp	x26, x25, [sp, #0x60]
100b48220:     	stp	x24, x23, [sp, #0x70]
100b48224:     	stp	x22, x21, [sp, #0x80]
100b48228:     	stp	x20, x19, [sp, #0x90]
100b4822c:     	stp	x29, x30, [sp, #0xa0]
100b48230:     	add	x29, sp, #0xa0
100b48234:     	adrp	x8, 0x106365000 <_zlibVersion+0x106365000>
100b48238:     	ldr	x8, [x8, #0x7f0]
100b4823c:     	ldr	x8, [x8]
100b48240:     	str	x8, [sp, #0x48]
100b48244:     	ldr	x8, [x0, #0x128]
100b48248:     	ldr	x8, [x8, #0x298]
100b4824c:     	cbz	x8, 0x100b482f8 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0xe4>
100b48250:     	mov	x20, x3
100b48254:     	mov	x19, x2
100b48258:     	mov	x21, x1
100b4825c:     	mov	x22, x0
100b48260:     	bl	0x101652b6c <__Z21ED_region_blend_alphaP7ARegion>
100b48264:     	fcmp	s0, #0.0
100b48268:     	b.ls	0x100b482f8 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0xe4>
100b4826c:     	fmov	s5, #1.00000000
100b48270:     	fsub	s4, s5, s0
100b48274:     	ldp	w26, w8, [x22, #0xa8]
100b48278:     	sub	w9, w8, w26
100b4827c:     	add	w10, w9, #0x1
100b48280:     	scvtf	s0, w10
100b48284:     	fmov	s1, #0.37500000
100b48288:     	fdiv	s0, s1, s0
100b4828c:     	ldp	w27, w10, [x22, #0xb0]
100b48290:     	add	w28, w10, #0x1
100b48294:     	sub	w10, w28, w27
100b48298:     	scvtf	s2, w10
100b4829c:     	fdiv	s1, s1, s2
100b482a0:     	add	w10, w8, #0x1
100b482a4:     	fadd	s3, s0, s5
100b482a8:     	fadd	s2, s1, s5
100b482ac:     	cmp	w19, #0x0
100b482b0:     	fmov	s6, wzr
100b482b4:     	fcsel	s4, s4, s6, ne
100b482b8:     	fmul	s4, s4, s4
100b482bc:     	scvtf	s7, w9
100b482c0:     	fsub	s4, s5, s4
100b482c4:     	fsub	s6, s5, s4
100b482c8:     	fmul	s5, s6, s7
100b482cc:     	ldrh	w8, [x22, #0xc2]
100b482d0:     	and	w8, w8, #0xf
100b482d4:     	cmp	w8, #0x3
100b482d8:     	b.eq	0x100b48300 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0xec>
100b482dc:     	cmp	w8, #0x4
100b482e0:     	b.ne	0x100b48310 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0xfc>
100b482e4:     	scvtf	s6, w26
100b482e8:     	fadd	s5, s5, s6
100b482ec:     	fcvtzs	w26, s5
100b482f0:     	fmul	s3, s4, s3
100b482f4:     	b	0x100b48310 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0xfc>
100b482f8:     	mov	w0, #0x0                ; =0
100b482fc:     	b	0x100b48470 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x25c>
100b48300:     	scvtf	s4, w10
100b48304:     	fsub	s4, s4, s5
100b48308:     	fcvtzs	w10, s4
100b4830c:     	fadd	s0, s6, s0
100b48310:     	stp	s0, s1, [sp, #0x38]
100b48314:     	stp	s3, s2, [sp, #0x40]
100b48318:     	scvtf	s0, w26
100b4831c:     	scvtf	s1, w27
100b48320:     	stp	s0, s1, [sp, #0x28]
100b48324:     	str	w10, [sp, #0xc]
100b48328:     	scvtf	s0, w10
100b4832c:     	scvtf	s1, w28
100b48330:     	stp	s0, s1, [sp, #0x30]
100b48334:     	cbz	w19, 0x100b48340 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x12c>
100b48338:     	mov	w0, #0x2                ; =2
100b4833c:     	bl	0x100a61d38 <__Z9GPU_blend9eGPUBlend>
100b48340:     	ldr	x8, [x22, #0x128]
100b48344:     	ldr	x8, [x8, #0x298]
100b48348:     	cbz	x8, 0x100b48360 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x14c>
100b4834c:     	ldr	x0, [x8, #0x8]
100b48350:     	cbz	x0, 0x100b48368 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x154>
100b48354:     	mov	x1, x21
100b48358:     	bl	0x100a678e4 <__Z26GPU_viewport_color_textureP11GPUViewporti>
100b4835c:     	b	0x100b48370 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x15c>
100b48360:     	mov	x21, #0x0               ; =0
100b48364:     	b	0x100b48374 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x160>
100b48368:     	ldr	x0, [x8]
100b4836c:     	bl	0x1008f469c <__Z27GPU_offscreen_color_texturePK12GPUOffScreen>
100b48370:     	mov	x21, x0
100b48374:     	mov	w0, #0x4                ; =4
100b48378:     	bl	0x10093e234 <__Z29GPU_shader_get_builtin_shader17eGPUBuiltinShader>
100b4837c:     	mov	x22, x0
100b48380:     	mov	x1, #0x0                ; =0
100b48384:     	bl	0x100903888 <__Z15GPU_shader_bindPN7blender3gpu6ShaderEPKNS0_6shader23SpecializationConstantsE>
100b48388:     	mov	x0, x22
100b4838c:     	mov	w1, #0xd                ; =13
100b48390:     	bl	0x1009044b8 <__Z30GPU_shader_get_builtin_uniformPN7blender3gpu6ShaderEi>
100b48394:     	mov	x23, x0
100b48398:     	adrp	x1, 0x104ba1000 <__ZZ25BLI_hash_md5_to_hexdigestPKvPcE7hex_map+0xb6e1>
100b4839c:     	add	x1, x1, #0x9ac
100b483a0:     	mov	x0, x22
100b483a4:     	bl	0x10090418c <__Z22GPU_shader_get_uniformPN7blender3gpu6ShaderEPKc>
100b483a8:     	mov	x24, x0
100b483ac:     	adrp	x1, 0x104ba1000 <__ZZ25BLI_hash_md5_to_hexdigestPKvPcE7hex_map+0xb6e1>
100b483b0:     	add	x1, x1, #0x9b6
100b483b4:     	mov	x0, x22
100b483b8:     	bl	0x10090418c <__Z22GPU_shader_get_uniformPN7blender3gpu6ShaderEPKc>
100b483bc:     	mov	x25, x0
100b483c0:     	adrp	x1, 0x104b85000 <_zlibVersion+0x104b85000>
100b483c4:     	add	x1, x1, #0xab5
100b483c8:     	mov	x0, x22
100b483cc:     	bl	0x1009046e0 <__Z30GPU_shader_get_sampler_bindingPN7blender3gpu6ShaderEPKc>
100b483d0:     	mov	x1, x0
100b483d4:     	mov	x0, x21
100b483d8:     	bl	0x100a643fc <__Z16GPU_texture_bindPN7blender3gpu7TextureEi>
100b483dc:     	add	x4, sp, #0x38
100b483e0:     	mov	x0, x22
100b483e4:     	mov	x1, x24
100b483e8:     	mov	w2, #0x4                ; =4
100b483ec:     	mov	w3, #0x1                ; =1
100b483f0:     	bl	0x100904a98 <__Z27GPU_shader_uniform_float_exPN7blender3gpu6ShaderEiiiPKf>
100b483f4:     	add	x4, sp, #0x28
100b483f8:     	mov	x0, x22
100b483fc:     	mov	x1, x25
100b48400:     	mov	w2, #0x4                ; =4
100b48404:     	mov	w3, #0x1                ; =1
100b48408:     	bl	0x100904a98 <__Z27GPU_shader_uniform_float_exPN7blender3gpu6ShaderEiiiPKf>
100b4840c:     	fmov.4s	v0, #1.00000000
100b48410:     	str	q0, [sp, #0x10]
100b48414:     	add	x4, sp, #0x10
100b48418:     	mov	x0, x22
100b4841c:     	mov	x1, x23
100b48420:     	mov	w2, #0x4                ; =4
100b48424:     	mov	w3, #0x1                ; =1
100b48428:     	bl	0x100904a98 <__Z27GPU_shader_uniform_float_exPN7blender3gpu6ShaderEiiiPKf>
100b4842c:     	bl	0x1008eb7a4 <__Z21GPU_batch_preset_quadv>
100b48430:     	mov	x23, x0
100b48434:     	mov	x1, x22
100b48438:     	mov	x2, #0x0                ; =0
100b4843c:     	bl	0x1008ea890 <__Z20GPU_batch_set_shaderPN7blender3gpu5BatchEPNS0_6ShaderEPKNS0_6shader23SpecializationConstantsE>
100b48440:     	mov	x0, x23
100b48444:     	bl	0x1008eac50 <__Z14GPU_batch_drawPN7blender3gpu5BatchE>
100b48448:     	cbz	x20, 0x100b48458 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x244>
100b4844c:     	ldr	w8, [sp, #0xc]
100b48450:     	stp	w26, w8, [x20]
100b48454:     	stp	w27, w28, [x20, #0x8]
100b48458:     	mov	x0, x21
100b4845c:     	bl	0x100a64438 <__Z18GPU_texture_unbindPN7blender3gpu7TextureE>
100b48460:     	cbz	w19, 0x100b4846c <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x258>
100b48464:     	mov	w0, #0x0                ; =0
100b48468:     	bl	0x100a61d38 <__Z9GPU_blend9eGPUBlend>
100b4846c:     	mov	w0, #0x1                ; =1
100b48470:     	ldr	x8, [sp, #0x48]
100b48474:     	adrp	x9, 0x106365000 <_zlibVersion+0x106365000>
100b48478:     	ldr	x9, [x9, #0x7f0]
100b4847c:     	ldr	x9, [x9]
100b48480:     	cmp	x9, x8
100b48484:     	b.ne	0x100b484a8 <__ZL28wm_draw_region_blend_receiptP7ARegionibP4rcti+0x294>
100b48488:     	ldp	x29, x30, [sp, #0xa0]
100b4848c:     	ldp	x20, x19, [sp, #0x90]
100b48490:     	ldp	x22, x21, [sp, #0x80]
100b48494:     	ldp	x24, x23, [sp, #0x70]
100b48498:     	ldp	x26, x25, [sp, #0x60]
100b4849c:     	ldp	x28, x27, [sp, #0x50]
100b484a0:     	add	sp, sp, #0xb0
100b484a4:     	ret
100b484a8:     	bl	0x104b71660 <_zlibVersion+0x104b71660>
