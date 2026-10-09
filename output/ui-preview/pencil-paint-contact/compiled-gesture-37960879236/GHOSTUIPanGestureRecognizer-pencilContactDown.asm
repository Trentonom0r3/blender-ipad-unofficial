
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010109ee5c <-[GHOSTUIPanGestureRecognizer pencilContactDown]>:
10109ee5c:     	adrp	x8, 0x1065ff000 <_zlibVersion+0x1065ff000>
10109ee60:     	ldrsw	x8, [x8, #0xda0]
10109ee64:     	add	x8, x0, x8
10109ee68:     	ldrb	w9, [x8, #0x10]
10109ee6c:     	cmp	w9, #0x1
10109ee70:     	b.ne	0x10109ee8c <-[GHOSTUIPanGestureRecognizer pencilContactDown]+0x30>
10109ee74:     	ldr	x9, [x8, #0x8]
10109ee78:     	cbz	x9, 0x10109ee8c <-[GHOSTUIPanGestureRecognizer pencilContactDown]+0x30>
10109ee7c:     	ldr	w8, [x8]
10109ee80:     	cmp	w8, #0x2
10109ee84:     	cset	w0, eq
10109ee88:     	ret
10109ee8c:     	mov	w0, #0x0                ; =0
10109ee90:     	ret
