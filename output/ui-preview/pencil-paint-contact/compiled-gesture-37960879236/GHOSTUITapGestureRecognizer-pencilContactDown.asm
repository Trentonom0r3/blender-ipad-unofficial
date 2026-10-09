
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010109c3e0 <-[GHOSTUITapGestureRecognizer pencilContactDown]>:
10109c3e0:     	adrp	x8, 0x1065ff000 <_zlibVersion+0x1065ff000>
10109c3e4:     	ldrsw	x8, [x8, #0xd8c]
10109c3e8:     	add	x8, x0, x8
10109c3ec:     	ldrb	w9, [x8, #0x10]
10109c3f0:     	cmp	w9, #0x1
10109c3f4:     	b.ne	0x10109c410 <-[GHOSTUITapGestureRecognizer pencilContactDown]+0x30>
10109c3f8:     	ldr	x9, [x8, #0x8]
10109c3fc:     	cbz	x9, 0x10109c410 <-[GHOSTUITapGestureRecognizer pencilContactDown]+0x30>
10109c400:     	ldr	w8, [x8]
10109c404:     	cmp	w8, #0x2
10109c408:     	cset	w0, eq
10109c40c:     	ret
10109c410:     	mov	w0, #0x0                ; =0
10109c414:     	ret
