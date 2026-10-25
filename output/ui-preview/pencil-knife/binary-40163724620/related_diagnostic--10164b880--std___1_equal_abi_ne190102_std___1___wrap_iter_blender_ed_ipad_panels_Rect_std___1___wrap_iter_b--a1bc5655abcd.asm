
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010164b880 <__ZNSt3__15equalB8ne190102INS_11__wrap_iterIPN7blender2ed4ipad6panels4RectEEES8_ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS9_5ModelEE3$_0EEbT_SI_T0_T1_>:
10164b880:     	cmp	x0, x1
10164b884:     	b.eq	0x10164b8d8 <__ZNSt3__15equalB8ne190102INS_11__wrap_iterIPN7blender2ed4ipad6panels4RectEEES8_ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS9_5ModelEE3$_0EEbT_SI_T0_T1_+0x58>
10164b888:     	ldr	w8, [x0]
10164b88c:     	ldr	w9, [x2]
10164b890:     	cmp	w8, w9
10164b894:     	b.ne	0x10164b8e0 <__ZNSt3__15equalB8ne190102INS_11__wrap_iterIPN7blender2ed4ipad6panels4RectEEES8_ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS9_5ModelEE3$_0EEbT_SI_T0_T1_+0x60>
10164b898:     	ldr	w8, [x0, #0x4]
10164b89c:     	ldr	w9, [x2, #0x4]
10164b8a0:     	cmp	w8, w9
10164b8a4:     	b.ne	0x10164b8e0 <__ZNSt3__15equalB8ne190102INS_11__wrap_iterIPN7blender2ed4ipad6panels4RectEEES8_ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS9_5ModelEE3$_0EEbT_SI_T0_T1_+0x60>
10164b8a8:     	ldr	w8, [x0, #0x8]
10164b8ac:     	ldr	w9, [x2, #0x8]
10164b8b0:     	cmp	w8, w9
10164b8b4:     	b.ne	0x10164b8e0 <__ZNSt3__15equalB8ne190102INS_11__wrap_iterIPN7blender2ed4ipad6panels4RectEEES8_ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS9_5ModelEE3$_0EEbT_SI_T0_T1_+0x60>
10164b8b8:     	ldr	w8, [x0, #0xc]
10164b8bc:     	ldr	w9, [x2, #0xc]
10164b8c0:     	cmp	w8, w9
10164b8c4:     	b.ne	0x10164b8e0 <__ZNSt3__15equalB8ne190102INS_11__wrap_iterIPN7blender2ed4ipad6panels4RectEEES8_ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS9_5ModelEE3$_0EEbT_SI_T0_T1_+0x60>
10164b8c8:     	add	x0, x0, #0x10
10164b8cc:     	add	x2, x2, #0x10
10164b8d0:     	cmp	x0, x1
10164b8d4:     	b.ne	0x10164b888 <__ZNSt3__15equalB8ne190102INS_11__wrap_iterIPN7blender2ed4ipad6panels4RectEEES8_ZN12_GLOBAL__N_123ipad_hud_chrome_captureEP8wmWindowP7bScreenRKNS9_5ModelEE3$_0EEbT_SI_T0_T1_+0x8>
10164b8d8:     	mov	w0, #0x1                ; =1
10164b8dc:     	ret
10164b8e0:     	mov	w0, #0x0                ; =0
10164b8e4:     	ret
