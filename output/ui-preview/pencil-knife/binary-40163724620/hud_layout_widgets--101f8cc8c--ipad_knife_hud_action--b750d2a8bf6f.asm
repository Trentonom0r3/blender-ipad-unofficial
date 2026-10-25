
D:\dev\Projects\Repos\blendpad\blender-ipad-unofficial\output\ui-preview\pencil-knife\binary-40163724620\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101f8cc8c <__ZL21ipad_knife_hud_actionP8bContextPvS1_>:
101f8cc8c:     	sub	sp, sp, #0xd0
101f8cc90:     	stp	x29, x30, [sp, #0xc0]
101f8cc94:     	add	x29, sp, #0xc0
101f8cc98:     	ldp	q0, q1, [x1, #0x80]
101f8cc9c:     	stp	q0, q1, [sp, #0x80]
101f8cca0:     	ldp	q0, q1, [x1, #0xa0]
101f8cca4:     	stp	q0, q1, [sp, #0xa0]
101f8cca8:     	ldp	q0, q1, [x1, #0x40]
101f8ccac:     	stp	q0, q1, [sp, #0x40]
101f8ccb0:     	ldp	q0, q1, [x1, #0x60]
101f8ccb4:     	stp	q0, q1, [sp, #0x60]
101f8ccb8:     	ldp	q0, q1, [x1]
101f8ccbc:     	stp	q0, q1, [sp]
101f8ccc0:     	ldp	q0, q1, [x1, #0x20]
101f8ccc4:     	stp	q0, q1, [sp, #0x20]
101f8ccc8:     	ldrb	w2, [sp, #0xb8]
101f8cccc:     	mov	x1, sp
101f8ccd0:     	bl	0x100b50c20 <__Z26WM_ipad_knife_action_queueP8bContextRK16wmIPadKnifeOwner17wmIPadKnifeAction>
101f8ccd4:     	ldp	x29, x30, [sp, #0xc0]
101f8ccd8:     	add	sp, sp, #0xd0
101f8ccdc:     	ret
