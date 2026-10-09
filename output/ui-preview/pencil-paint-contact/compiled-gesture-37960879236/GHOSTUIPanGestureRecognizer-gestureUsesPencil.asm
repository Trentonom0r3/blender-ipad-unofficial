
C:\Users\tjerf\AppData\Local\Temp\blender-ipad-run-37960879236\Blender-launch-audit:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010109ee30 <-[GHOSTUIPanGestureRecognizer gestureUsesPencil]>:
10109ee30:     	adrp	x8, 0x1065ff000 <_zlibVersion+0x1065ff000>
10109ee34:     	ldrsw	x8, [x8, #0xda0]
10109ee38:     	add	x8, x0, x8
10109ee3c:     	ldr	x9, [x8, #0x8]
10109ee40:     	cbz	x9, 0x10109ee54 <-[GHOSTUIPanGestureRecognizer gestureUsesPencil]+0x24>
10109ee44:     	ldr	w8, [x8]
10109ee48:     	cmp	w8, #0x2
10109ee4c:     	cset	w0, eq
10109ee50:     	ret
10109ee54:     	mov	w0, #0x0                ; =0
10109ee58:     	ret
