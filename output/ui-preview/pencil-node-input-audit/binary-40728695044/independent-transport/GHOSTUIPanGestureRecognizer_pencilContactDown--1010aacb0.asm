
output\ui-preview\pencil-node-input-audit\binary-40728695044\Blender:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001010aacb0 <-[GHOSTUIPanGestureRecognizer pencilContactDown]>:
1010aacb0:     	adrp	x8, 0x106627000 <_zlibVersion+0x106627000>
1010aacb4:     	ldrsw	x8, [x8, #0xf5c]
1010aacb8:     	add	x8, x0, x8
1010aacbc:     	ldrb	w9, [x8, #0x18]
1010aacc0:     	cmp	w9, #0x1
1010aacc4:     	b.ne	0x1010aace0 <-[GHOSTUIPanGestureRecognizer pencilContactDown]+0x30>
1010aacc8:     	ldr	x9, [x8, #0x8]
1010aaccc:     	cbz	x9, 0x1010aace0 <-[GHOSTUIPanGestureRecognizer pencilContactDown]+0x30>
1010aacd0:     	ldr	w8, [x8]
1010aacd4:     	cmp	w8, #0x2
1010aacd8:     	cset	w0, eq
1010aacdc:     	ret
1010aace0:     	mov	w0, #0x0                ; =0
1010aace4:     	ret
