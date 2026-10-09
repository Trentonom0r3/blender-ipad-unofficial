
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010109c3b4 <-[GHOSTUITapGestureRecognizer gestureUsesPencil]>:
10109c3b4:     	adrp	x8, 0x1065ff000 <_zlibVersion+0x1065ff000>
10109c3b8:     	ldrsw	x8, [x8, #0xd8c]
10109c3bc:     	add	x8, x0, x8
10109c3c0:     	ldr	x9, [x8, #0x8]
10109c3c4:     	cbz	x9, 0x10109c3d8 <-[GHOSTUITapGestureRecognizer gestureUsesPencil]+0x24>
10109c3c8:     	ldr	w8, [x8]
10109c3cc:     	cmp	w8, #0x2
10109c3d0:     	cset	w0, eq
10109c3d4:     	ret
10109c3d8:     	mov	w0, #0x0                ; =0
10109c3dc:     	ret
