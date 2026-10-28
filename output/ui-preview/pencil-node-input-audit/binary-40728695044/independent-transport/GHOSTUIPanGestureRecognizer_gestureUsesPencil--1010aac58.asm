
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010aac58 <-[GHOSTUIPanGestureRecognizer gestureUsesPencil]>:
1010aac58:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aac5c:     	ldrsw	x8, [x8, #0xf5c]
1010aac60:     	add	x8, x0, x8
1010aac64:     	ldr	x9, [x8, #0x8]
1010aac68:     	cbz	x9, 0x1010aac7c <-[GHOSTUIPanGestureRecognizer gestureUsesPencil]+0x24>
1010aac6c:     	ldr	w8, [x8]
1010aac70:     	cmp	w8, #0x2
1010aac74:     	cset	w0, eq
1010aac78:     	ret
1010aac7c:     	mov	w0, #0x0                ; =0
1010aac80:     	ret
